# BetterNotesAttachmentsPermissions
<p><strong>Update | 12-30-17</strong></p>
<p>-Note Permission Checking functioning at Profile & User hierarchy levels </p>
<p>-Attachment Permission Checking WIP </p>

<p>Small project to create granular Note & Attachment Permissioning tools. SF is pretty limited as far as this goes. Standard Note/Attachment permissions are a glorified on-off switch without any middleground. This will change that.</p>

<p><strong>NOTE:</strong><p>
<p> I am using <strong>Custom Settings of the Hierachy Type</strong> to handle the permission toggling</p>

<p><strong>Goals:</strong></p>
<p>Intuitive Permission Management for Notes and Attachments</p>
<p>Triggers to prevent certain operations on Notes and Attachments depending on a Profile/User's ID and the user's selected Permission level</p>
<p>e.g. Insert, Update, Deletion permissions correspond with the relevant Trigger on-fire actions</p>

<p><strong>How It Will Work:</strong></p>
<p>The information below is how I intend for the completed code to function. It is currently a work in Progress and not 100% functional, so this information is not specific to what has been completed.</p>
<p>After all functionality in this project has been completed, <strong>you will need to enable full Note/Attachment permissions for all users</strong>.</p>
<p>Users without a Custom Setting entry for their Profile or User will default to <strong>No Permissions</strong> (overriding the profile/permission set profiles, so don't worry about people getting access when they shouldn't - the triggers will override their profile permissions).</p>
<p> You only need to add the User Record OR User Profile to the Custom Setting Hierarchy. If you add both to the Custom Settings, the User Custom Setting entry will override the Profile entry if a user has both - this is good if you want to give a specific user more access than their profile allows without giving access to the others sharing that profile</p>

