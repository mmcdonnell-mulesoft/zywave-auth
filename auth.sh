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
# FF4303FE1510DF1FCD7B05A64E6411E2C706F49BC061D5D12D9619EE4C6985D8

# Original Access Token
# eyJhbGciOiJSUzI1NiIsImtpZCI6IjQxQTdDOEE5RTcwQzZFQjNDQjRBRkI3NjU1NzNERDRDRDY4NDMxN0RSUzI1NiIsIng1dCI6IlFhZklxZWNNYnJQTFN2dDJWWFBkVE5hRU1YMCIsInR5cCI6ImF0K2p3dCJ9.eyJpc3MiOiJodHRwczovL2F1dGguenl3YXZlLmNvbSIsIm5iZiI6MTcxMjAxMTUzMSwiaWF0IjoxNzEyMDExNTMxLCJleHAiOjE3MTIwMTUxMzEsImF1ZCI6WyJaeXdhdmUuQXBpLlByb2ZpbGVzIiwiWnl3YXZlLkFwaS5BcGlHYXRld2F5IiwiWnl3YXZlLkFwaS5BY2NvdW50cyIsIlp5d2F2ZS5BcGkuQWNjb3VudHMuMi4wIiwiWnl3YXZlLkFwaS5BY2NvdW50cy4yLjEiLCJaeXdhdmUuQXBpLlBsYW5zIiwiI3tQbGFuczpBcGlSZXNvdXJjZTpOYW1lfSIsIlp5d2F2ZS5BcGkuQmtiIl0sInNjb3BlIjpbImFwaS5wcm9maWxlcyIsImFwaS5hY2NvdW50cyIsImFwaS5wbGFucyIsImFwaS5ia2IiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsicHdkIl0sImNsaWVudF9pZCI6ImJjYTg1NDQwLTNlODAtNDUwNC05NjgyLTY2NTlhOWU4NDljZSIsInN1YiI6IjdkOTExNmE5LTgyNDUtNDRlZC1hODQ2LTcyY2M3ZDhjZDJmMyIsImF1dGhfdGltZSI6MTcxMjAxMTUyNywiaWRwIjoiaHR0cHM6Ly9hdXRoLnp5d2F2ZS5jb20iLCJzaWQiOiJDQzZERjlGQkYyOEMxMzFFMzZFQjg0MzMzNkNGNTJENiJ9.SkM-Qgu75iY2TQKYnxScvdkTtJbXL6n53FXK12tOqSflqU202hcUkVBCG40wCkOOwD_X9KZuWhudMGWzFLGs1_qjSUKc5OC_ikDAkn8SlrYvCBnyEjPOmggGFVqQN3RfbcIITYvE1n7iSkwcfvH2fGzzBHmGksR6g13PDDz_08OHzuyG88p6LGGB1Yf3cJp-s8nc1GaotLChkygmD-HOM0kwvw3QQtTNAIWy2mshPd_2p2jvZEpOf3o-y1N7fNNQVND6q5VmSIp2IbQ8Gfjx9K2_uO-nrzBdDQROjV_j6_TUvgOIOwO_YAbVPpWPqpbXcKTM4OOQ-dcnHsYPobW0MQ

# Refresh Token Request # THIS WORKS 

# curl --request POST \
#         --url https://auth.zywave.com/connect/token \
#         --header 'Content-Type: application/x-www-form-urlencoded' \
#         --data client_id=${CLIENTID} \
#         --data client_secret=${CLIENTSECRET} \
#         --data grant_type=refresh_token \
#         --data refresh_token=92A8CD4C45EA1197DC99613E3E897D677009A32822E31215E155CFBD6F3BECF0 # You updated italready. Go ahead and rerun