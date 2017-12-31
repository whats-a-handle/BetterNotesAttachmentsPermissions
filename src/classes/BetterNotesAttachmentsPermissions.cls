public with sharing class BetterNotesAttachmentsPermissions{


    private static Id userID;
    private static Id userProfileID;
    private static BetterNotesAttachmentsSettings__c userProfileSettings;
    private static BetterNotesAttachmentsSettings__c userIDSettings;
    private static String errorMessage;
    private static boolean hasProfileSettings = false;
    private static boolean hasIDSettings = false;
    private static Map<String,Boolean> userPermissionMap = new Map<String,Boolean>{'insert' =>false,'update'=>false,'delete'=>false};

    public static void setUserInfo(Id userInfoID, Id userInfoProfileID){
        userId = userInfoID;
        userProfileId = userInfoProfileID;
        userProfileSettings = BetterNotesAttachmentsSettings__c.getValues(userProfileId);
        userIDSettings = BetterNotesAttachmentsSettings__c.getValues(userId);

        if(userProfileSettings != null){
            hasProfileSettings = true;
        }

        if(userIDSettings != null){
            hasIDSettings = true;
        }

        setPermissionMap();
 
    }

    public static void setPermissionMap(){

        if(hasProfileSettings){

            userPermissionMap.put('insert',userProfileSettings.Insert_Note__c);
            userPermissionMap.put('update',userProfileSettings.Update_Note__c);
            userPermissionMap.put('delete',userProfileSettings.Delete_Note__c);

        }

        if(hasIDSettings){

            userPermissionMap.put('insert',userIDSettings.Insert_Note__c);
            userPermissionMap.put('update',userIDSettings.Update_Note__c);
            userPermissionMap.put('delete',userIDSettings.Delete_Note__c);

        }

    }
   

    public static void checkAddPermissions(List<Note> noteList){
        errorMessage = 'You do not have permission to INSERT notes';
        if(!userPermissionMap.get('insert')){
            displayError(noteList);
        }
  
    }
    public static void checkUpdatePermissions( List<Note> noteList){
        errorMessage = 'You do not have permission to UPDATE notes';
        if(!userPermissionMap.get('update')){
            displayError(noteList);
        }
    }

    public static void checkDeletePermissions(List<Note> noteList){
        errorMessage = 'You do not have permission to DELETE notes';
        if(!userPermissionMap.get('delete')){
            displayError(noteList);
        }    
    }
    public static void displayError(List<Note>noteList){
        
        for(Note n : noteList){
                n.addError(errorMessage);
        }
    
    }


}