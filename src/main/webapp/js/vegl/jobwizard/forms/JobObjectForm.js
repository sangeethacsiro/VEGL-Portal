/**
 * Job wizard form for creating and editing a new Job Object
 *
 * Author - Josh Vote
 */

Ext.define('vegl.jobwizard.forms.JobObjectForm', {
    extend : 'vegl.jobwizard.forms.BaseJobWizardForm',

    jobObjectCreated : false,

    /**
     * Creates a new JobObjectForm form configured to write/read to the specified global state
     */
    constructor: function(wizardState) {
        var jobObjectFrm = this;

        jobObjectFrm.jobObjectCreated = false;

        this.callParent([{
            wizardState : wizardState,
            bodyStyle: 'padding:10px;',
            frame: true,
            defaults: { anchor: "100%" },
            labelWidth: 150,
            autoScroll: true,
            listeners : {
                //The first time this form is active create a new job object
                jobWizardActive : function() {
                    if (!jobObjectFrm.jobObjectCreated) {
                        jobObjectFrm.getForm().load({
                            url : 'createJobObject.do',
                            waitMsg : 'Creating Job Object...',
                            failure : Ext.bind(jobObjectFrm.fireEvent, jobObjectFrm, ['jobWizardLoadException']),
                            success : function(frm, action) {
                                var responseObj = Ext.JSON.decode(action.response.responseText);

                                if (responseObj.success) {
                                    frm.setValues(responseObj.data[0]);
                                    jobObjectFrm.jobObjectCreated = true;
                                    jobObjectFrm.wizardState.jobId = frm.getValues().id;
                                }
                            }
                        });
                    }
                }
            },
            items: [{
                xtype: 'textfield',
                name: 'name',
                fieldLabel: 'Job Name',
                emptyText : 'Enter an optional descriptive name for your job here.',
                allowBlank: true
            },{
                xtype: 'textfield',
                name: 'description',
                fieldLabel: 'Job Description',
                emptyText : 'Enter an optional description for your job here.',
                allowBlank: true
            },{
                xtype: 'textfield',
                name: 'storageBucket',
                emptyText: 'Enter a cloud storage container where your job results will be stored',
                fieldLabel: 'Storage Container',
                value : 'vegl-portal',
                allowBlank: false
            },{
                xtype: 'textfield',
                name: 'storageAccessKey',
                emptyText: 'Enter a cloud storage access key that will be used to store your job outputs',
                fieldLabel: 'Storage Access Key',
                allowBlank: false
            }, {
                xtype: 'textfield',
                name: 'storageSecretKey',
                inputType: 'password',
                fieldLabel: 'Storage Secret Key',
                allowBlank: false
            },
            { xtype: 'hidden', name: 'id' },
            { xtype: 'hidden', name: 'emailAddress' },
            { xtype: 'hidden', name: 'user' },
            { xtype: 'hidden', name: 'submitDate' },
            { xtype: 'hidden', name: 'status' },
            { xtype: 'hidden', name: 'computeVmId' },
            { xtype: 'hidden', name: 'computeInstanceId' },
            { xtype: 'hidden', name: 'computeInstanceType' },
            { xtype: 'hidden', name: 'computeInstanceKey' },
            { xtype: 'hidden', name: 'storageProvider' },
            { xtype: 'hidden', name: 'storageEndpoint' },
            { xtype: 'hidden', name: 'storageBaseKey' },
            { xtype: 'hidden', name: 'registeredUrl' },
            { xtype: 'hidden', name: 'paddingMinEasting' },
            { xtype: 'hidden', name: 'paddingMaxEasting' },
            { xtype: 'hidden', name: 'paddingMinNorthing' },
            { xtype: 'hidden', name: 'paddingMaxNorthing' },
            { xtype: 'hidden', name: 'selectionMinEasting' },
            { xtype: 'hidden', name: 'selectionMaxEasting' },
            { xtype: 'hidden', name: 'selectionMinNorthing' },
            { xtype: 'hidden', name: 'selectionMaxNorthing' },
            { xtype: 'hidden', name: 'mgaZone' },
            { xtype: 'hidden', name: 'cellX' },
            { xtype: 'hidden', name: 'cellY' },
            { xtype: 'hidden', name: 'cellZ' },
            { xtype: 'hidden', name: 'inversionDepth' },
            { xtype: 'hidden', name: 'vmSubsetFilePath' },
            { xtype: 'hidden', name: 'vmSubsetUrl' }
            ]
        }]);
    },

    getTitle : function() {
        return "Enter job details...";
    },

    beginValidation : function(callback) {
        var jobObjectFrm = this;

        //Ensure we have entered all appropriate fields
        if (!jobObjectFrm.getForm().isValid()) {
            callback(false);
        }

        //Then save the job to the database before proceeding
        jobObjectFrm.getForm().submit({
            url : 'updateJob.do',
            params : {
                seriesId : jobObjectFrm.wizardState.seriesId
            },
            waitMsg : 'Saving Job state...',
            failure : function() {
                Ext.Msg.alert('Internal Error', 'There was an error saving these job details. Please try again in a few minutes.');
                callback(false);
            },
            success : function() {
                callback(true);
            }
        });

    }
});