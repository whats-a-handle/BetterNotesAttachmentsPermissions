trigger BetterNotePermissionsTrigger on Note (before insert, before update, before delete) {

    
    
    BetterNotesAttachmentsPermissions.checkPermissions(Trigger.new, UserInfo.getUserId());

    
    
}