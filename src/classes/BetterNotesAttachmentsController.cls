public with sharing class BetterNotesAttachmentsController {
    
    public List<BetterNotesAttachmentsUser> wrappedUsers {get;set;}
    public BetterNotesAttachmentsUser selectedUser {get;set;}
    public string selectedUserID {get;set;}
    
    public BetterNotesAttachmentsController(){
        wrappedUsers = new List<BetterNotesAttachmentsUser>();
        getUserList();   
    }
 

    public void getUserList(){

        if(wrappedUsers != null){
            wrappedUsers.clear();
        }
        List<User> userRecords = [Select Id, Name, Email FROM User];

        for(User u : userRecords){

            wrappedUsers.add(new BetterNotesAttachmentsUser(u));
        }
    }

    public void selectUser(){

        selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);

        if(selectedUser.permissions == null){

            BetterNotesAttachmentsSettings__c newSettings = new BetterNotesAttachmentsSettings__c(SetupOwnerId = selectedUser.uid);
            try{
                database.insert(newSettings);
                selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);
                if(selectedUser.permissions != null){
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'User Missing Custom Setting Entry but we were able to create a Custom Setting entry for your user!'));
                }
                else{
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The creation of the Custom Setting was successful,'+
                    ' but the selectedUser.permissions returned null. Please reload the page.'));
                }
            }
            catch(Exception e){
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Selected User had no Custom Setting Entry,' + 
                 'and we weren\'t able to create one for you. ' + e));
            }
            
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Selected User has an entry in Custom Settings. Please proceed!'));
        }

    }

    public void updateNoteInsert(){

        selectUser();
         try{
            boolean previousPermission = selectedUser.permissions.Insert_Note__c;
             selectedUser.permissions.Insert_Note__c = !selectedUser.permissions.Insert_Note__c;
             database.update(selectedUser.permissions);

            selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);
            
            if(selectedUser.permissions.Insert_Note__c == previousPermission){

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'The update was successful, but our re-query of the user says otherwise'));
            }
            else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'The update was successful!'));
            }
        }
        catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'We were\'nt able to update the permissions for this user'+
            'Here\'s why: ' + e));
        }
        getUserList();
    }

    public void updateNoteUpdate(){

        selectUser();
        try{
            boolean previousPermission = selectedUser.permissions.Update_Note__c;
             selectedUser.permissions.Update_Note__c = !selectedUser.permissions.Update_Note__c;
             database.update(selectedUser.permissions);

            selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);
            
            if(selectedUser.permissions.Update_Note__c == previousPermission){

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The update was successful, but our re-query of the user says otherwise'));
            }
            else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'The update was successful!'));
            }
        }
        catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'We were\'nt able to update the permissions for this user'+
            'Here\'s why: ' + e));
        }
       
         getUserList();
    }

    public void updateNoteDelete(){

        selectUser();
       try{
            boolean previousPermission = selectedUser.permissions.Delete_Note__c;
             selectedUser.permissions.Delete_Note__c = !selectedUser.permissions.Delete_Note__c;
             database.update(selectedUser.permissions);

            selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);
            
            if(selectedUser.permissions.Delete_Note__c == previousPermission){

                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'The update was successful, but our re-query of the user says otherwise'));
            }
            else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'The update was successful!'));
            }
        }
        catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'We were\'nt able to update the permissions for this user'+
            'Here\'s why: ' + e));
        }

        getUserList();
         
    }

}