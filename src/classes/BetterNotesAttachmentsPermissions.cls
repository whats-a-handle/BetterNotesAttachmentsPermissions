public with sharing class BetterNotesAttachmentsPermissions{


    private static Id userID;
    private static Id userProfileID;
    private static BetterNotesAttachmentsSettings__c userProfileSettings;
    private static BetterNotesAttachmentsSettings__c userIDSettings;
    private static String errorMessage;
    private static boolean hasProfileSettings = false;
    private static boolean hasIDSettings = false;
    private static SObjectType objectType;
    private static Map<SObjectType,Map<String,Boolean>> userPermissionMap = new Map<SOBJECTType,Map<String,Boolean>>{
        Note.SObjectType => new Map<String,Boolean> {'insert' =>false,'update'=>false,'delete'=>false},
        Attachment.SObjectType => new Map<String,Boolean>{'insert'=>false,'update'=>false,'delete'=>false}};         

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

        if(userProfileSettings == null && userIDSettings == null){
            userProfileSettings = new BetterNotesAttachmentsSettings__c();
            userIDSettings = new BetterNotesAttachmentsSettings__c();
        }

        setPermissionMap();
 
    }

    private static void setPermissionMap(){

        if(hasProfileSettings){
            userPermissionMap.get(Note.getSObjectType()).put('insert',userProfileSettings.Insert_Note__c);
            userPermissionMap.get(Note.getSObjectType()).put('update',userProfileSettings.Update_Note__c);
            userPermissionMap.get(Note.getSObjectType()).put('delete',userProfileSettings.Delete_Note__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('insert',userProfileSettings.Insert_Attachment__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('update',userProfileSettings.Update_Attachment__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('delete',userProfileSettings.Delete_Attachment__c);
        }

        if(hasIDSettings){
            userPermissionMap.get(Note.getSObjectType()).put('insert',userIDSettings.Insert_Note__c);
            userPermissionMap.get(Note.getSObjectType()).put('update',userIDSettings.Update_Note__c);
            userPermissionMap.get(Note.getSObjectType()).put('delete',userIDSettings.Delete_Note__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('insert',userIDSettings.Insert_Attachment__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('update',userIDSettings.Update_Attachment__c);
            userPermissionMap.get(Attachment.getSObjectType()).put('delete',userIDSettings.Delete_Attachment__c);
        }
    }
   
    public static void checkAddPermissions(List<SOBJECT> noteAttachList){
        errorMessage = 'You do not have permission to INSERT ' + String.valueOf(noteAttachList.getSObjectType()) + 's';
        if(!userPermissionMap.get(noteAttachList.getSObjectType()).get('insert')){
            displayError(noteAttachList);
        }
    }
    public static void checkUpdatePermissions( List<SOBJECT> noteAttachList){
        errorMessage = 'You do not have permission to UPDATE ' + String.valueOf(noteAttachList.getSObjectType()) + 's';
        if(!userPermissionMap.get(noteAttachList.getSObjectType()).get('update')){
            displayError(noteAttachList);
        }
    }

    public static void checkDeletePermissions(List<SOBJECT> noteAttachList){
        errorMessage = 'You do not have permission to DELETE ' + String.valueOf(noteAttachList.getSObjectType()) + 's';
        if(!userPermissionMap.get(noteAttachList.getSObjectType()).get('delete')){
            displayError(noteAttachList);
        }    
    }
    private static void displayError(List<SOBJECT>noteAttachList){  
        for(SOBJECT n : noteAttachList){
                n.addError(errorMessage);
        }   
    }


}