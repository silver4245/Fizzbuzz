/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-17-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class FizzBuzzInvocable {
   
   
    public class Game {
        @InvocableVariable(required=true)
        public ID recordId;
   }

    @InvocableMethod(label='Play FizzBuzz')
    public static void playFizzBuzz(List<Game> games) {
        List<Output__c> outputs = new List<Output__c>();
        // Query related Variable__c records
            
        for (Game game : games) {
            Game__c gameRecord = [SELECT Id, Name, Number_of_Interactions__c FROM Game__c WHERE Id = :game.recordId LIMIT 1];
            List<Variable__c> variables = [
                SELECT Id, Special_Name__c, Number__c
                FROM Variable__c
                WHERE Game__c = :game.recordId
            ];
Integer iterationCount = gameRecord.Number_of_Interactions__c.intvalue();
            For (integer i = 1; i <= iterationCount; i++){
                Output__c output = new Output__c();
            output.Game__c = game.recordId;
            //output.Answer__c = String.valueOf(i);
            output.answer__c = String.valueOf(answerCalc(variables, i));
            output.Name = 'APEX - ' + String.valueOf(i);
            output.Number__c = i;
            outputs.add(output);
            
        }
        }
        insert outputs;
    }

     private static string answerCalc(List<Variable__c> varList, integer iterationCount) {
           string result = '';
            
            // Add further processing logic here if needed

            for ( Variable__C variable: varList){
                        if (Math.Mod(iterationCount,variable.Number__c.intvalue()) == 0) {

                        result += variable.Special_Name__c + ' ';
             }
            }
                    return result.trim() == '' ? String.valueOf(iterationCount) : result.trim();

    }       
}