declare module "@salesforce/apex/SimpleServerSideController.serverEcho" {
  export default function serverEcho(param: {firstName: any}): Promise<any>;
}
declare module "@salesforce/apex/SimpleServerSideController.triggerBasicAuraHandledError" {
  export default function triggerBasicAuraHandledError(): Promise<any>;
}
declare module "@salesforce/apex/SimpleServerSideController.getAccount" {
  export default function getAccount(): Promise<any>;
}
declare module "@salesforce/apex/SimpleServerSideController.getContact" {
  export default function getContact(param: {accountIdStr: any}): Promise<any>;
}
