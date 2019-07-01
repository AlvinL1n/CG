<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  	<aura:handler name="getoem" event="c:getoemevent" action="{!c.handleComponentEvent}"/>
  	<aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
  	<aura:attribute name="selectedLookUpRecord2" type="sObject" default="{}"/>
 	<aura:attribute name="oemlist" type="List"/>
 	<aura:attribute name="traderoute_choose" type="String"/>
 	<lightning:select name="select1" label="贸易路线" value="{!v.traderoute_choose}">
 		<aura:iteration items="{!v.oemlist}" var="oem">
        	<option value="{!oem}" >{!oem}</option>       
       	</aura:iteration>
    </lightning:select>
  	<c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name" acc2="{!v.selectedLookUpRecord2}"/>
  	<c:customLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord2}" label="Account Name" acc2="{!v.selectedLookUpRecord}"/>
 <!-- here c: is org. namespace prefix-->
</aura:application>