trigger AccountTrigger on Account (before insert, after Insert, Before update, after Update, before Delete) {
    
    If(Trigger.isAfter && Trigger.isDelete){
        AccountTriggerHandler.sendEmailOnAfterDelete(Trigger.old);
    }
    
    If(Trigger.isBefore && Trigger.isDelete){
        for(Account accOld : Trigger.Old){
            if(accOld.Active__c == 'Yes')
                accOld.addError('Youc cannnot delete an active account');
        }
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accIdsWhichGotBillingAddressChanged = new Set<Id>();
        for(Account accRecNew : Trigger.New){
            Account accRecOld = Trigger.OldMap.get(accRecNew.Id);
            if(accRecNew.BillingStreet != accRecOld.BillingStreet){
                accIdsWhichGotBillingAddressChanged.add(accRecNew.Id);
            }
        }
        
        List<Account> accWithContacts = [SELECT id, name, billingcity, 
                                        billingstate,billingCountry,
                                        (SELECT id, name from Contacts) 
                                        from Account WHERE ID in : accIdsWhichGotBillingAddressChanged];
        
        List <Contact> contsListToUpdate = new List<Contact>();
        
        for(Account acc : accWithContacts){
            List<Contact> consOfTheLoopedAccount = acc.contacts;
            for(Contact con : ConsOfTheLoopedAccount){
                con.MailingStreet = acc.BillingStreet;
                con.MailingCity = acc.billingCity;
                con.MailingState = acc.BillingState;
                con.Mailingcountry = acc.BillingCountry;
                contsListToUpdate.add(con);
            }
        }
        
        if(contsListToUpdate.size() > 0 ){
            update contsListToUpdate;
        }
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('New Values');
        System.debug(Trigger.new);
        
        for(Account accRecNew : Trigger.new){
            Account accRecOld = Trigger.oldMap.get(accRecNew.Id);
            if(accRecNew.Name != accRecOld.Name){
                accRecNew.addError('Account Name cannot be modified/changed once it is created');
            }
        }
      
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        
        List<contact> conListToInsert = new List<Contact>();
        for(Account accRec : Trigger.new){
            Contact con = new contact();
            con.LastName = accRec.Name;
            con.AccountId = accRec.Id;
            conListToInsert.add(con);
        }
        
        if(conListToInsert.size() > 0)
            insert conListToInsert;
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        
        for(Account accRec : Trigger.new){
            /*SCENARIO 2 */
             if(accRec.AnnualRevenue < 1000)
                 accRec.addError('Annual Revenu cannot be less than 1000');
            
            
            
            /*SCENARIO 1*/
            if(accRec.ShippingCity == null)
                accRec.shippingCity = accRec.BillingCity;
            if(accRec.shippingCountry == null)
                accRec.shippingCountry = accRec.BillingCountry;
            if(accRec.shippingState == null)
                accRec.shippingState = accRec.BillingState;
           if(accRec.shippingStreet == null)
                accRec.shippingStreet = accRec.BillingStreet;
            if(accRec.shippingPostalCode == null)
            accRec.shippingPostalCode = accRec.BillingPostalCode;
        }
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        AccountHandler.insertContact(Trigger.new);
    }
}