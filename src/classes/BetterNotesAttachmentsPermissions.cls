public class BetterNotesAttachmentsPermissions{

private static  Set<ID> allowedIDs = new Set<ID>();


private static void setIDs(){

    allowedIDs.add('0051N000005457N');
}
public static void checkPermissions(List<Note>noteList, ID userID){

    setIDs();
    
   for(Note n : noteList){

       if(!allowedIDs.contains(userId)){
           n.addError('Oops, you aint on the list bub');
       }
   }


}


}