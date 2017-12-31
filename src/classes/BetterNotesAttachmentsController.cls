public with sharing class BetterNotesAttachmentsController {
    
    public List<BetterNotesAttachmentsUser> userList {get;set;}
    public BetterNotesAttachmentsUser selectedUser {get;set;}
    public string selectedUserID {get;set;}
    public BetterNotesAttachmentsController(){
        userList = new List<BetterNotesAttachmentsUser>();

        getUserList();
         
    }
 

    public void getUserList(){

        List<User> userListTwo = [Select Id, Name, Email FROM User];

        for(User u : userListTwo){

            userList.add(new BetterNotesAttachmentsUser(u));
        }
    }

    public void selectUser(){

        selectedUser = new BetterNotesAttachmentsUser([Select Id, Name, Email FROM User WHERE Id =: selectedUserId]);

    }

}