declare module "@salesforce/apex/LDS_PaginationController.getAllRecords" {
  export default function getAllRecords(param: {pageNumber: any, currnetPagesCount: any}): Promise<any>;
}
declare module "@salesforce/apex/LDS_PaginationController.getPageCountInfo" {
  export default function getPageCountInfo(param: {pageCountInfo: any}): Promise<any>;
}
declare module "@salesforce/apex/LDS_PaginationController.getPageCountChange" {
  export default function getPageCountChange(param: {pageNumber: any, currnetPagesCount: any, totalPages: any}): Promise<any>;
}
