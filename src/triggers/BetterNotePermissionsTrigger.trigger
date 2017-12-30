trigger BetterNotePermissionsTrigger on Note (before insert, before update, before delete) {

   BetterNotesAttachmentsPermissions.setUserInfo(UserInfo.getUserId(), UserInfo.getProfileId());

   if(Trigger.isInsert){

      BetterNotesAttachmentsPermissions.checkAddPermissions(Trigger.new);
   }
   else if(Trigger.isUpdate){
       BetterNotesAttachmentsPermissions.checkUpdatePermissions(Trigger.new);
   }
   else if(Trigger.isDelete){

       BetterNotesAttachmentsPermissions.checkDeletePermissions(Trigger.old);
   }
  
}