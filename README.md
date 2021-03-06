# BetterNotesAttachmentsPermissions
<p><strong>Update | 02-03-18</strong></p>
<p>Basic <strong>Pagination</strong> working</p>

<p><strong>NOTE:</strong><p>
<p> I am using <strong>Custom Settings of the Hierachy Type</strong> to handle the permission toggling</p>
<p> If you'd like to use the code, you'll need to create a Custom Setting named <strong>BetterNotesAttachmentsSettings</strong> of the Hierachy Type, and create the following "fields" under that. You can certainly use your own Custom Setting name, but be sure to adjust the code accordingly.</p>
<p><strong>Note-specific Custom Setting fields</strong></p>
<p>-Insert_Note__c</p>
<p>-Update_Note__c</p>
<p>-Delete_Note__c</p>
<p><strong>Attachment-specific Custom Setting fields</strong></p>
<p>-Insert_Attachment__c</p>
<p>-Update_Attachment__c</p>
<p>-Delete_Attachment__c</p>

<p><strong>Goals:</strong></p>
<p>Small project to create granular Note & Attachment Permissioning tools.</p>
<p><strong>Unmanaged Package for easy install and no-fuss setup</strong><p>
<p>Intuitive Permission Management for Notes and Attachments</p>
<p>Triggers to prevent certain operations on Notes and Attachments depending on a Profile/User's ID and the user's selected Permission level</p>
<p>e.g. Insert, Update, Deletion permissions correspond with the relevant Trigger on-fire actions</p>


<p><strong>How It Will Work:</strong></p>
<p>The information below is how I intend for the completed code to function. It is currently a work in Progress and not 100% functional, so this information is not specific to what has been completed.</p>
<p>Users without a Custom Setting entry for their Profile or User will default to <strong>No Permissions</strong> (overriding the profile/permission set profiles, so don't worry about people getting access when they shouldn't - the triggers will override their profile permissions).</p>
<p> You only need to add the User Record OR User Profile to the Custom Setting Hierarchy. If you add both to the Custom Settings, the User Custom Setting entry will override the Profile entry if a user has both - this is good if you want to give a specific user more access than their profile allows without giving access to the others sharing that profile</p>

