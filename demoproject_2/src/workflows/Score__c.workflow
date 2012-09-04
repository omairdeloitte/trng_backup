<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_mail_to_mentor</fullName>
        <description>Send mail to mentor</description>
        <protected>false</protected>
        <recipients>
            <recipient>akagupta1234@deloitte.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>omair7akram@deloitte.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>titans@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MentorMail</template>
    </alerts>
    <rules>
        <fullName>sendmentormail</fullName>
        <actions>
            <name>Send_mail_to_mentor</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Score__c.Marks_Scored__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Send a mail to mentor to let him know the scores of his mentee.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
