public class BetterNotesAttachmentsPermissions{


    private static Id userID;
    private static Id userProfileID;
    private static BetterNotesAttachmentsSettings__c userProfileSettings;
    private static BetterNotesAttachmentsSettings__c userIDSettings;
    private static String errorMessage;

    public static void setUserInfo(Id userInfoID, Id userInfoProfileID){
        userId = userInfoID;
        userProfileId = userInfoProfileID;
        userProfileSettings = BetterNotesAttachmentsSettings__c.getValues(userProfileId);
        userIDSettings = BetterNotesAttachmentsSettings__c.getValues(userId);
    }

    public static void checkAddPermissions(List<Note> noteList){
        errorMessage = 'You do not have permission to INSERT notes';
        if(!userProfileSettings.Add_Note__c){
            displayError(noteList, errorMessage);
        }
  
    }
    public static void checkUpdatePermissions( List<Note> noteList){
        errorMessage = 'You do not have permission to UPDATE notes';
        if(!userProfileSettings.Edit_Note__c){
            displayError(noteList, errorMessage);
        }
    }

    public static void checkDeletePermissions(List<Note> noteList){
        errorMessage = 'You do not have permission to DELETE notes';
        if(!userProfileSettings.Delete_Note__c){
            displayError(noteList, errorMessage);
        }    
    }
    private static void displayError(List<Note>noteList, String errorMessage){
        
        for(Note n : noteList){
                n.addError(errorMessage);
        }
    
    }


}