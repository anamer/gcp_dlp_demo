#!/bin/bash
# Redact pii data from csv file, keep CC and role only
filename='my_pii_data.csv'
output_file='mi_pii_data_redacted.csv'
rm $output_file 2> /dev/null
while read line; do
# reading each line
python deid.py deid_mask --info_types FIRST_NAME LAST_NAME EMAIL_ADDRESS DATE PHONE_NUMBER DOMAIN_NAME  LOCATION IBAN_CODE  ORGANIZATION_NAME  -n 12 -m '*' $PROJECT_ID "$line" >> $output_file
done < $filename
