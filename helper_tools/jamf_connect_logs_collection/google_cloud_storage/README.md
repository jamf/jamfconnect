# Jamf Connect Logs Collection (Google Cloud Storage)

This script is provided to trigger and collect the output from an `jamfconnect logs` and upload it to an Google Cloud Storage bucket.

## Workflow Steps

Steps to create the workflow:

- [ ] Create [gcs_jclogscollect.pkg](#gcs_pkg) and upload to Jamf Pro 
- [ ] Jamf Pro - Upload [jc_logs_self_service.sh](./jc_logs_self_service.sh)
- [ ] Jamf Pro - [Create Policies](#policies)
    - Jamf Connect Logs Collect
    - GCS Credentials

## Workflow Components

####  <a id="policies"></a>Policies

|Name|Frequency|Trigger|Scope|Payload|
|----|---------|-------|-----|-------|
|**Jamf Connect Logs Collect**|Ongoing|Self Service|All Managed Clients|jc_logs_self_service.sh
|**GCS Credentials**|Ongoing|gcs_creds|All Managed Clients|gcs_jclogscollect.pkg

**Google Cloud Configuration**

> **Note** 
> `gsutil` requires Python3

- Create a Google Cloud Bucket and a service account with `Storage Object Creator` and `Storage Object Viewer` roles applied.
- Create <a id="gcs_pkg"></a>Google Cloud Configuration file:
    1. Install [Google Cloud CLI](https://cloud.google.com/sdk/docs/downloads-interactive#silent)
    2. Configure the Boto configuration file. Run the following in Terminal.app:
        - `/usr/local/google-cloud-sdk/bin/gsutil config -a`
    3. Use included makefile to create pkg. Run the following from within the project folder in Terminal.app:
        - `sudo make pkg`
    4. Copy gcs_aftermath.pkg to Jamf Pro.
    5. Clean up after upload complete. Run the following from within the project folder in Terminal.app:
        - `sudo make clean`
#
## Please note that all resources contained within this repository are provided as-is and are not officially supported by Jamf Support.