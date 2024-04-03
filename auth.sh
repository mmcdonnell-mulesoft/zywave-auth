#!/bin/bash
ZYWAVEBASEURL="https://auth.zywave.com/connect"
ZYWAVEAUTHURL="${ZYWAVEBASEURL}/authorize"
ZYAUTHTOKENURL="${ZYWAVETOKENURL}/token"
MIMEFORM="Content-Type: application/x-www-form-urlencoded"
CLIENTID=""
CLIENTSECRET=""
USERNAME=""
PASSWORD=''
CALLBACKURL=""
SCOPELIST='api.prtokenes api.accounts api.plans offline_access api.bkb'

# Initial Call redirects (302) THIS DOES NOT WORK IN CURL WITHOUT A LOT MORE WORK

# curl -v --request POST --url "${ZYWAVEAUTHURL}" --header "${MIMEFORM}" \
#     --data client_id=${CLIENTID} --data client_secret=${CLIENTSECRET} \
#     --data grant_type=authorization_code --data "redirect_uri=${CALLBACKURL}" \
#     --data response_type=code --data scope="api.profiles api.accounts api.plans offline_access api.bkb"

# Follow the redirect - we managed to snag the token.

# Original Refresh Token
# 

# Original Access Token
# 
# Refresh Token Request # THIS WORKS 

# curl --request POST \
#         --url https://auth.zywave.com/connect/token \
#         --header 'Content-Type: application/x-www-form-urlencoded' \
#         --data client_id=${CLIENTID} \
#         --data client_secret=${CLIENTSECRET} \
#         --data grant_type=refresh_token \
#         --data refresh_token=$INSERT_TOKEN_HERE # You updated italready. Go ahead and rerun