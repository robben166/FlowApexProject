public class caseHelperCls {
    
	public static Boolean executedAlready = FALSE;
    
    public Static void afterInsert(List<Case> newParentCaseList){
        	if(!executedAlready){
            executedAlready = TRUE;
        	List<Case> childCases = new List<Case>();
        	for(Case parent : newParentCaseList){
            	if(parent.Reason == 'Breakdown'){
                	Case childCase = new Case(ParentId = parent.Id,
                                         											Subject = 'Follow up',
                                         											Reason = 'Breakdown');
                	childCases.add(childCase);
            	}
        	}
        	insert childCases;
        }
    }
}