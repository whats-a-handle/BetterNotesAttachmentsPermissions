public with sharing class BetterNotesAttachmentsUser{
 
    public String email {get; private set;}
    public String name {get;private set;}
    public String uid {get;private set;}
    public BetterNotesAttachmentsSettings__c permissions {get; private set;}

    public BetterNotesAttachmentsUser(){}
    public BetterNotesAttachmentsUser(User newUser){
        email = newUser.email;
        name = newUser.name;
        uid = newUser.id;
        permissions = BetterNotesAttachmentsSettings__c.getValues(newUser.id);

        if(permissions == null){
            permissions = new BetterNotesAttachmentsSettings__c();
        }

    } 

        

    


 
}