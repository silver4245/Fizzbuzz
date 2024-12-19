/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class InvocableDelete {
    

    public class getGame {
        @InvocableVariable(required=true)
        public ID recordId;
   }

   @InvocableMethod(label = 'Hard Delete')
        Public static void deleteRecords(List<getGame> getGames){
        //List<Output__c> outputs = [
          //      SELECT Id
            //    FROM Output__c
              //  WHERE Game__c = :getGames.recordId
            //];
// Collect all Game__c IDs for querying related Output__c records
        Set<Id> gameIds = new Set<Id>();
        for (GetGame input : getGames) {
            if (input.recordId != null) {
                gameIds.add(input.recordId);
            }
        }

 // Query related Output__c records
        List<Output__c> outputsToDelete = [
            SELECT Id
            FROM Output__c
            WHERE Game__c IN :gameIds
        ];


        try {
             delete outputsToDelete;
              Database.emptyRecycleBin(outputsToDelete);
                } catch (DmlException e) {
    // Process exception here
}
   }
}