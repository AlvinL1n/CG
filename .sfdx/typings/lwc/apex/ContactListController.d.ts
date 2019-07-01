declare module "@salesforce/apex/ContactListController.getContactList" {
  export default function getContactList(param: {accountIds: any}): Promise<any>;
}
declare module "@salesforce/apex/ContactListController.saveContactList" {
  export default function saveContactList(param: {contactList: any}): Promise<any>;
}
declare module "@salesforce/apex/ContactListController.deleteContactList" {
  export default function deleteContactList(param: {contactIds: any}): Promise<any>;
}
declare module "@salesforce/apex/ContactListController.createContactRecord" {
  export default function createContactRecord(param: {newContact: any}): Promise<any>;
}
