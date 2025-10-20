#!/bin/bash

get(){
getcookies=$(curl -c - 'https://shopee.co.id/api/v2/user/account_info?from_wallet=false&skip_address=1&need_cart=1' -H 'User-Agent: Mozilla/5.0 (Linux; Android 9.0; MI 8 SE) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.119 Mobile Safari/537.36' -H 'Accept: application/json' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://shopee.co.id/buyer/login?' -H 'X-Shopee-Language: id' -H 'X-Requested-With: XMLHttpRequest' -H 'X-API-SOURCE: rweb' -H 'X-CSRFToken: '$url'' -H 'Content-Type: application/json'  -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Cookie: csrftoken='$url'' -H 'TE: Trailers' --compressed -s)
  echo "$getcookies" > /tmp/getcookies-$nomor
    SPC_R_T_ID=$(cat /tmp/getcookies-$nomor | awk -F"SPC_R_T_ID" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_EC=$(cat /tmp/getcookies-$nomor | awk -F"SPC_EC" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_F=$(cat /tmp/getcookies-$nomor | awk -F"SPC_F" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    REC_T_ID=$(cat /tmp/getcookies-$nomor | awk -F"REC_T_ID" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_T_ID=$(cat /tmp/getcookies-$nomor | awk -F"SPC_T_ID" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_SI=$(cat /tmp/getcookies-$nomor | awk -F"SPC_SI" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_R_T_IV=$(cat /tmp/getcookies-$nomor | awk -F"SPC_R_T_IV" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
    SPC_T_IV=$(cat /tmp/getcookies-$nomor | awk -F"SPC_T_IV" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
}
login1(){
  lgn1=$(curl 'https://shopee.co.id/api/v2/authentication/login' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-77dded3934d6bab4d88969d193d745e6' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/buyer/login?' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"phone":"'$nomor'","password":"a7b2b36322301f63c922636455b1a61fc8da546fd3df8bb9afc19e6efd09f070","support_whats_app":true,"support_ivs":true}' \
  --compressed -s)
  #{"version":"8553d5c9d0bff31d8309e318c7d915c3","data":{"otp_available_channels":null,"otp_tracking_id":null,"ivs_flow_no":"273bc15b-e1ee-4651-9888-a7973ffc10b6","ivs_token":"U2FsdGVkX1/2K1tFAaRBkI3Cm1iM3ncUuL/y6lEKEcsgBGqHiWjAcwlV6qkuogI5DGP00GWdxOJL/0lWkhPvwdQYkxqOM0ihjpUWZ9RVvO3AO9blvk1me9kMSZOgmOi9FJQIPJU8BP+3Qxr81jodXJ2ZZc0vCA6ioEeHd+h79XJIgdDdfH44iMfkAaR2i+K9gjkyUUb/QLwUB0igMGbj86B1KHDk5F+vxBm5GjkFJMI=","userid":null},"error_msg":null,"error":98}
version=$(echo $lgn1 | jq '.version' | tr -d '"')
ivs_flow_no=$(echo $lgn1 | jq '.data.ivs_flow_no' | tr -d '"')
ivs_token=$(echo $lgn1 | jq '.data.ivs_token' | tr -d '"')
}
login2(){
  lgn2=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/methods' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-8f3c06cb256a3b269394301578dee825' -H 'content-type: application/json' -H 'x-csrftoken: 'url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/verify/ivs?is_initial=true' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"event":1,"u_token":"'$ivs_token'"}' \
  --compressed -s)
  #{"bff_meta":null,"error":0,"data":[{"type":5,"v_token":"U2FsdGVkX1+JLq7ssFGWP8UBlvzj4Ce3ToNhk7PunsbADd8wTVUVyAWtK/NPW8htTPnZ5vmWNdpDof7xK4Y7S2+AsfAfAwQCKI6Otl3M67hxUzvuVVdz8csqOqlSEbLpi1Xa552dPfWKNVyaLOYH0A=="}]}
v_token=$(echo $lgn2 | jq '.data[].v_token' | tr -d '"')
}
send(){
  snd=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/link/verify' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-245fafc2d3b37159f47b9eaaaf1703fe' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/verify/link' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"v_token":"'$v_token'","request_id":"'$ivs_token'"}' \
  --compressed -s)
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"phone_number":"+62 83*******80","r_token":"U2FsdGVkX19nzQhRtPxKSOvE9psJj3E6RxXOsm6rmkXozKKzNzEsxyCD+v3jdm1Aql7qu4Q10GIoBVd2CXNv/JW1Aj2hDuW+NcNwhY6KurXQXXBCAKmdYtozfvIQAqjIb0izkYFM8WW6XCrqiaJF9V9QOHvH3iFMkhhtLyQSGU2ZEL7x7bNUePykj+dUd//VacHTZvsw8Iub3f2LRoq0kI7gEdDZjnhWu5eeW5Ty4vxH0ooVVm7PKut01cCSF4neJRwhrWyIWjQWyJ2hDPMGak0XyCxDcQXjC3zsTYY1yHuyTqx8XqovB67a1vqhcG3a/0hit6tIU++T5BH5bZsO1WTU99pj7jgYXhvqVan8hxPrPge89q3uJglQqzAjkHnqdpBQWx+Q1BbAmcgGXuHR/m+cv3TCfmvIOJ1ZOsMDY/fUBrkvmjhDv3LYpczQnA5IWvRXCzBxrSPwdWGfoOZZTTg+yYCnyyq0FfNBBJZr7RwK9E7Lqo75v7yrgMIGMX2d","msg_type":1}}
msg_type=$(echo $snd | jq '.data')
echo $msg_type
r_token=$(echo $snd | jq '.data.r_token' | tr -d '"')
}
status1(){
loap=$(while true
do
  stts1=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/link/get_status' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-65bf51c566c618b54175bfa7dd0f40f9' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/verify/link' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"r_token":"'$r_token'"}' \
  --compressed -s)
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"link_status":1}}
  linkstts=$(echo $stts1 | jq '.data.link_status')
  if [ $linkstts = 2 ];then
    break
  fi
done)
}
otp(){
read -p "Masukan Link : " text
  tpk1=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/link/get_info' -H 'User-Agent: Mozilla/5.0 (Android 11; Mobile; rv:83.0) Gecko/83.0 Firefox/83.0' -H 'Accept: application/json' -H 'Accept-Language: id,en-US;q=0.7,en;q=0.3' --compressed -H 'Referer: https://shopee.co.id/dlink/verify/link?q=fYBwcVWe' -H 'X-Shopee-Language: id' -H 'X-Requested-With: XMLHttpRequest' -H 'X-API-SOURCE: rweb' -H 'X-CSRFToken: '$url'' -H 'Content-Type: application/json' -H 'If-None-Match-: 55b03-ca193dac3cd8c49673fbe004b53e8a1c' -H 'Origin: https://shopee.co.id' -H 'Connection: keep-alive' \
 --data-raw '{"short_token":"'$text'"}' -s)
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"link_status":1,"request_time":1629980743,"device":"Chrome Linux","near":"Yogyakarta ID"}}
  #{"bff_meta":null,"error":81900101,"error_msg":null,"data":{"link_status":0,"request_time":0,"device":"","near":""}}
echo tpk1 $tpk1
echo
  tpk2=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/link/update_info' -H 'User-Agent: Mozilla/5.0 (Android 11; Mobile; rv:83.0) Gecko/83.0 Firefox/83.0' -H 'Accept: application/json' -H 'Accept-Language: id,en-US;q=0.7,en;q=0.3' --compressed -H 'Referer: https://shopee.co.id/dlink/verify/link?q=fYBwcVWe' -H 'X-Shopee-Language: id' -H 'X-Requested-With: XMLHttpRequest' -H 'X-API-SOURCE: rweb' -H 'X-CSRFToken: '$url'' -H 'Content-Type: application/json' -H 'If-None-Match-: 55b03-e5f9debbbe1454bc84db98e34c117636' -H 'Origin: https://shopee.co.id' -H 'Connection: keep-alive' \
 --data-raw '{"short_token":"'$text'","link_status":2}' -s)
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"link_status":1,"request_time":1629980743,"device":"Chrome Linux","near":"Yogyakarta ID"}}
  #{"bff_meta":null,"error":81900101,"error_msg":null,"data":{"link_status":0,"request_time":0,"device":"","near":""}}
echo tpk2 $tpk2
ulng=$(echo $tpk2 | jq '.error')
echo
}
resendotp(){
while true
do
  if [ $ulng = 81900101 ]; then
    echo -e "\e[33;1mLink yang anda masukan salah (error 81900101)\e[0m"
    echo
    otp
  else
    break
  fi
done
}
status2(){
  stts2=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/link/get_status' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-65bf51c566c618b54175bfa7dd0f40f9' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/verify/link' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"r_token":"'$r_token'"}' \
  --compressed -s)
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"link_status":2}}
}
verify(){
  ver=$(curl 'https://shopee.co.id/api/v4/anti_fraud/ivs/token/verify' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-73cf3ac138bdee526026a02ed3d7b4d6' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/verify/ivs' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"method_name":5,"event":1,"u_token":"'$ivs_token'","r_token":"'$r_token'","v_token":"'$v_token'","misc":{"operation":0}}' \
  --compressed -s)
  #{"bff_meta":null,"error":0,"signature":"U2FsdGVkX18W1HMu+I8gGpa2Nr1587uLLsl1zzcQ3KPEYBZpZ6O7ie+wrMrDxAs1924q0wfwxYcuWmGm6VudYdjdOl1xrXKRRaLlsVh5tLzsw0pzOzJrd85SiVIps4kRtXFczIdvKQ4o+qsTqMZeZod1FkqFyhuv3bGWWpRvp2QlDFUjjDWzVeNvaacQOQs9jY8Dsklp2gBj1dlSLvHYCLHk0I12MZ+nyLeoDDft/sNvmLfTCgLGe0tAbqfMN1kDAZVYllti9kUNm6stMCzwGOA3SjA6luOVEIO+UBxW+mMMbp4m96b0hY6TpiCMTIvPA4fryfz9KHC+4vLyDG7AeQUXwGhwn6U1CABQ7R82imx53muua0J7IEq4UkL2NJxIcBg1nC1akqsROlsjIf+TPswIc8lPslqORtviZt2aQtLtc7r4xyDyeSGpNpqWPO7CsgZ2occhFNdcWkPwe5YObt6sWTYH+aOjoUE4tmSpzg0CFZ05+yx1JnQV+1r8VcNsIGl+PsZ81w+U1MDcUyHW9A==","event":1}
  #{"data":null,"error":49900000,"error_msg":""}
  signature=$(echo $ver | jq '.signature' | tr -d '"')
}
last1(){
  lstlgn1=$(curl -c - 'https://shopee.co.id/api/v4/account/basic/login_ivs' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-56e5cae24afa0c107934eb26b2d76e72' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/authenticate/ivs' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"is_user_login":true,"is_web":true,"ivs_flow_no":"'$ivs_flow_no'","ivs_signature":"'$signature'","ivs_method":5}' \
  --compressed -s)
  echo $lstlgn1
  echo "$lstlgn1" > /tmp/last-$nomor
  SPC_EC2=$(cat /tmp/last-$nomor | awk -F"SPC_EC" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"userid":474151026}}
  #{"bff_meta":null,"error":2,"error_msg":"ivs validate signature error 50200104","data":null}
}
last2(){
  lstlgn2=$(curl -c - 'https://shopee.co.id/api/v4/account/basic/login_ivs' -H 'authority: shopee.co.id' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/83.0.4103.61 Chrome/83.0.4103.61 Safari/537.36' -H 'x-api-source: pc' -H 'accept: application/json' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-56e5cae24afa0c107934eb26b2d76e72' -H 'content-type: application/json' -H 'x-csrftoken: '$url'' -H 'origin: https://shopee.co.id' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/authenticate/ivs' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'cookie: REC_T_ID='$REC_T_ID'; SPC_F='$SPC_F'; SPC_SI='$SPC_SI'; csrftoken='$url'; SPC_IA='$SPC_IA'; SPC_EC='$SPC_EC'; SPC_U='$SPC_U'; SPC_R_T_ID='$SPC_R_T_ID'; SPC_T_ID='$SPC_T_ID'; SPC_R_T_IV='$SPC_R_T_IV'; SPC_T_IV='$SPC_T_IV'' \
  --data-binary '{"is_user_login":true,"is_web":true,"ivs_flow_no":"'$ivs_flow_no'","ivs_signature":"'$signature'","ivs_method":5}' \
  --compressed -s)
  echo $lstlgn2
  echo "$lstlgn2" > /home/lendra/shopee3/sessions/loginsessions-$nomor
  #{"bff_meta":null,"error":0,"error_msg":null,"data":{"userid":474151026}}
  #{"bff_meta":null,"error":2,"error_msg":"ivs validate signature error 50200104","data":null}
}

address(){
  dress=$(curl 'https://shopee.co.id/api/v4/account/address/get_user_address_list' -H 'authority: shopee.co.id' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'if-none-match-: 55b03-ef96d9b3a9ee2de1c3d675193555dd6d' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' -H 'x-api-source: pc' -H 'accept: */*' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id/user/account/address' -H 'accept-language: id-ID,id;q=0.9' -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --compressed -s)
  #{"error":0,"data":{"addresses":[{"id":75024699,"userid":474151026,"name":"among darsono","phone":"6287837655480","country":"ID","state":"JAWA TENGAH","city":"KAB. SUKOHARJO","address":"Tengklik, RT.4/RW.11, Telukan, Grogol","status":2,"ctime":1624535214,"mtime":1627059252,"zipcode":"57552","deftime":1624535214,"full_address":"","district":"GROGOL","town":"","logistics_status":0,"icno":"","label":"label_address_label_home","address_instruction":"","geoinfo":{"region":{"latitude":-7.62958,"longitude":110.822296},"formattedAddress":"","placeId":"dspoi_v07_1153171220_317827708487_pv07_0","user_verified":true,"user_adjusted":true},"label_id":0,"is_delivery_address":true}]}}
  #{"data":null,"error":19,"error_msg":""}
  id=$(echo $dress | jq '.data.addresses[].id')
  userid=$(echo $dress | jq '.data.addresses[].userid')
  name=$(echo $dress | jq '.data.addresses[].name' | tr -d '"')
  phone=$(echo $dress | jq '.data.addresses[].phone' | tr -d '"')
  country=$(echo $dress | jq '.data.addresses[].country' | tr -d '"')
  state=$(echo $dress | jq '.data.addresses[].state' | tr -d '"')
  city=$(echo $dress | jq '.data.addresses[].city' | tr -d '"')
  address=$(echo $dress | jq '.data.addresses[].address' | tr -d '"')
  status=$(echo $dress | jq '.data.addresses[].status')
  ctime=$(echo $dress | jq '.data.addresses[].ctime')
  mtime=$(echo $dress | jq '.data.addresses[].mtime')
  zipcode=$(echo $dress | jq '.data.addresses[].zipcode' | tr -d '"')
  deftime=$(echo $dress | jq '.data.addresses[].deftime')
  district=$(echo $dress | jq '.data.addresses[].district' | tr -d '"')
  alamat=( $state $city $district $address $zipcode )
}
models(){
  model=$(curl 'https://shopee.co.id/api/v4/item/get?itemid='$itemid'&shopid='$shopid'' -H 'authority: shopee.co.id' -H 'x-shopee-language: id' -H 'x-requested-with: XMLHttpRequest' -H 'af-ac-enc-dat' -H 'if-none-match-: 55b03-2809e7dce6662c905b4d9c3d6f2153e2' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' -H 'x-api-source: pc' -H 'accept: */*' -H 'sec-fetch-site: same-origin' -H 'sec-fetch-mode: cors' -H 'sec-fetch-dest: empty' -H 'referer: https://shopee.co.id' -H 'accept-language: id-ID,id;q=0.9' -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --compressed -s)
  namabarang=$(echo $model | jq '.data.name' | tr -d '"')
  modelid=$(echo $model | jq '.data.models[].modelid')
  aqila=($modelid)
  #{"data":{"itemid":5769203282,"shopid":355618947,"userid":474151026,"price_max_before_discount":-1,"has_lowest_price_guarantee":false,"price_before_discount":0,"price_min_before_discount":-1,"exclusive_price_info":null,"hidden_price_display":null,"price_min":100000000,"price_max":100000000,"price":100000000,"stock":551,"discount":null,"historical_sold":447,"sold":35,"show_discount":0,"raw_discount":0,"min_purchase_limit":0,"overall_purchase_limit":{"order_max_purchase_limit":0,"overall_purchase_limit":null,"item_overall_quota":null,"start_date":null,"end_date":null},"pack_size":null,"is_live_streaming_price":null,"name":"Mama Lemon / So Klin Sachet","ctime":1607931621,"item_status":"normal","status":1,"condition":1,"catid":100630,"description":"MAMA Lemon Jeruk nipis\nSo Klin Sachet \n\nPengiriman Random sesuai Stock\n","is_mart":false,"show_shopee_verified_label":false,"size_chart":null,"reference_item_id":"","brand":null,"item_rating":{"rating_star":4.8342857142857145,"rating_count":[175,1,0,6,13,155]},"label_ids":[1000246,1006732,1001660,1000006,1000247,1001038,1001025,1001026,35,1003107,1004684,1004682,1002164,1006212,1003097,1000031,1007093],"attributes":null,"liked":false,"liked_count":522,"cmt_count":175,"flag":131072,"shopee_verified":false,"is_adult":false,"is_preferred_plus_seller":false,"tier_variations":[{"name":"","options":[""],"images":null,"properties":null,"type":0}],"bundle_deal_id":0,"can_use_bundle_deal":false,"add_on_deal_info":null,"bundle_deal_info":null,"can_use_wholesale":false,"wholesale_tier_list":[],"is_group_buy_item":null,"group_buy_info":null,"welcome_package_type":0,"welcome_package_info":null,"images":["492831d5c1ce6a83fa1ae3f1286afc0f","ed95402d228527181c965c0bad2445b4"],"image":"492831d5c1ce6a83fa1ae3f1286afc0f","video_info_list":null,"item_type":0,"is_official_shop":false,"show_official_shop_label_in_title":false,"shop_location":"KOTA BOGOR","coin_earn_label":null,"cb_option":0,"is_pre_order":false,"estimated_days":2,"badge_icon_type":0,"show_free_shipping":false,"shipping_icon_type":0,"cod_flag":0,"show_original_guarantee":true,"categories":[{"catid":100630,"display_name":"Perawatan \u0026 Kecantikan","no_sub":false,"is_default_subcat":false},{"catid":100664,"display_name":"Perawatan Wajah","no_sub":false,"is_default_subcat":false},{"catid":100897,"display_name":"Scrub \u0026 Peel Wajah","no_sub":true,"is_default_subcat":false}],"other_stock":551,"item_has_post":false,"discount_stock":0,"current_promotion_has_reserve_stock":false,"current_promotion_reserved_stock":0,"normal_stock":551,"brand_id":0,"is_alcohol_product":false,"show_recycling_info":false,"coin_info":{"spend_cash_unit":100000,"coin_earn_items":[]},"models":[{"itemid":5769203282,"status":1,"current_promotion_reserved_stock":0,"name":"","promotionid":0,"price":100000000,"price_stocks":[{"allocated_stock":null,"stock_breakdown_by_location":null}],"current_promotion_has_reserve_stock":false,"normal_stock":551,"extinfo":{"tier_index":[0],"group_buy_info":null},"price_before_discount":0,"modelid":72426974905,"stock":551,"has_gimmick_tag":false}],"spl_info":null,"preview_info":null,"is_cc_installment_payment_eligible":false,"is_non_cc_installment_payment_eligible":false,"flash_sale":null,"upcoming_flash_sale":null,"deep_discount":null,"has_low_fulfillment_rate":false,"is_partial_fulfilled":false,"makeups":null},"error":null,"error_msg":null}
}
addcart(){
  add=$(curl 'https://shopee.co.id/api/v4/cart/add_to_cart' \
  -H 'authority: shopee.co.id' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'x-api-source: pc' \
  -H 'accept: application/json' \
  -H 'x-shopee-language: id' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'if-none-match-: 55b03-e270427cdd74b007042658018722e2f6' \
  -H 'content-type: application/json' \
  -H 'x-csrftoken: '$url'' \
  -H 'origin: https://shopee.co.id' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://shopee.co.id' \
  -H 'accept-language: id-ID,id;q=0.9' \
  -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --data-raw '{"quantity":1,"checkout":true,"update_checkout_only":false,"donot_add_quantity":false,"source":"{\"refer_urls\":[]}","client_source":1,"shopid":'$shopid',"itemid":'$itemid',"modelid":'$modl'}' \
  --compressed -s)
  #{"error":0,"error_msg":"","data":{"problematic_items":null,"cart_item":{"itemid":5769203282,"modelid":72426974905,"item_group_id":null,"currency":"IDR","price":100000000,"quantity":1}}}
  echo addcart $add
  echo
}
get(){
  waktu=$(date +%s)
  getlol=$(curl 'https://shopee.co.id/api/v2/checkout/get' \
  -H 'authority: shopee.co.id' \
  -H 'x-cv-id: 106' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-shopee-language: id' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'if-none-match-: 55b03-9daae96a78647c4ccf905fd4cdc0db13' \
  -H 'x-api-source: pc' \
  -H 'x-csrftoken: '$url'' \
  -H 'origin: https://shopee.co.id' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://shopee.co.id/checkout' \
  -H 'accept-language: id-ID,id;q=0.9' \
  -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --data-raw '{"_cft":[3],"timestamp":'$waktu',"shoporders":[{"shop":{"shopid":'$shopid'},"items":[{"itemid":'$itemid',"modelid":'$modl',"quantity":1,"add_on_deal_id":0,"is_add_on_sub_item":false,"item_group_id":0,"insurances":[]}],"shipping_id":1}],"selected_payment_channel_data":{"version":2,"channel_id":8005200,"channel_item_option_info":{"option_info":"'$bank'"}},"promotion_data":{"use_coins":false,"free_shipping_voucher_info":{"free_shipping_voucher_id":0,"free_shipping_voucher_code":"","disabled_reason":null,"banner_info":{"msg":"","learn_more_msg":""}},"platform_vouchers":[],"shop_vouchers":[],"check_shop_voucher_entrances":true,"auto_apply_shop_voucher":false},"fsv_selection_infos":[],"device_info":{"device_id":"","device_fingerprint":"","tongdun_blackbox":"","buyer_payment_info":{}},"cart_type":0,"client_id":0,"dropshipping_info":{"enabled":false,"name":"","phone_number":""},"shipping_orders":[{"buyer_address_data":{"addressid":'$id',"address_type":0,"tax_address":""},"selected_logistic_channelid":'$kurir',"shipping_id":1,"shoporder_indexes":[0],"buyer_ic_number":"","selected_preferred_delivery_time_option_id":0,"sync":true,"selected_preferred_delivery_time_slot_id":null}],"order_update_info":{},"checkout_price_data":{"shipping_discount_subtotal":0,"tax_payable":0,"tax_exemption":0,"promocode_applied":null,"credit_card_promotion":null,"shopee_coins_redeemed":null,"group_buy_discount":0,"bundle_deals_discount":null,"buyer_txn_fee":0,"insurance_subtotal":0},"tax_info":{"tax_id":""}}' \
  --compressed -s)
  echo getlol $getlol
  echo
}
place1(){
  plsorder1=$(curl 'https://shopee.co.id/api/v2/checkout/place_order' \
  -H 'authority: shopee.co.id' \
  -H 'x-cv-id: 106' \
  -H 'x-sap-access-f: 3.2.88.4.0|111|1.0.0_0.3.7_2_6408|eb7460d58bdf4dc382d5138fd3d9d2cc0ce16437b7e549|10101|100' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-shopee-language: id' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'x-sap-access-t: 1629500008' \
  -H 'if-none-match-: 55b03-0b8781db4bcea404b17fc2cfa1acbf02' \
  -H 'x-api-source: pc' \
  -H 'x-sap-access-s: R6mYVZX2qJIN1VAyg0IXW4bp2ZOvH5hEXm4h5ljVISE=' \
  -H 'x-csrftoken: '$url'' \
  -H 'origin: https://shopee.co.id' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://shopee.co.id/checkout' \
  -H 'accept-language: id-ID,id;q=0.9' \
  -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --data-raw "$getlol" \
  --compressed -s)
  #{"checkoutid":83561210676291,"redirect_url":"https://shopee.co.id/payment/6117917165152500927?to_local_spm=0&__mobile__=1?allow_change_payment_method=1","timestamp":1629862010,"has_non_shippable_item":false,"payment_type":2,"orderids":[83561210686525],"is_group_buy":false,"group_buy_groupid":0,"is_shopee_cod":false,"navigation_info":{"type":1,"data":{}},"cmo_req_msg":null}
  #{"error":"error_params","error_msg":"Beberapa informasi produk pada pesanan Anda telah diperbarui, mohon kembali ke halaman keranjang dan coba lagi."}
  echo place1 $plsorder1
  echo
}
place2(){
  waktu=$(date +%s)
  plsorder1=$(curl 'https://shopee.co.id/api/v2/checkout/place_order' \
  -H 'authority: shopee.co.id' \
  -H 'x-cv-id: 106' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36' \
  -H 'content-type: application/json' \
  -H 'accept: application/json' \
  -H 'x-shopee-language: id' \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'if-none-match-: 55b03-af7e29acf3827032d6dcd50fabb98bf8' \
  -H 'x-api-source: pc' \
  -H 'x-csrftoken: '$url'' \
  -H 'origin: https://shopee.co.id' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://shopee.co.id/checkout' \
  -H 'accept-language: id-ID,id;q=0.9' \
  -H 'cookie: csrftoken='$url'; SPC_EC='$SPC_EC2'' \
  --data-raw '{"status":200,"headers":{},"client_id":0,"cart_type":0,"timestamp":'$waktu',"checkout_price_data":{"merchandise_subtotal":'$harga'00000,"total_payable":'$total'00000,"shipping_subtotal":'$ongkir'00000,"shipping_subtotal_before_discount":'$ongkir'00000,"shipping_discount_subtotal":0,"tax_payable":0,"tax_exemption":0,"promocode_applied":null,"credit_card_promotion":null,"shopee_coins_redeemed":null,"group_buy_discount":0,"bundle_deals_discount":null,"buyer_txn_fee":100000000,"insurance_subtotal":0},"order_update_info":{},"dropshipping_info":{"enabled":false,"name":"","phone_number":""},"promotion_data":{"applied_voucher_code":null,"voucher_code":null,"can_use_coins":false,"use_coins":false,"platform_vouchers":[],"free_shipping_voucher_info":{"free_shipping_voucher_id":0,"free_shipping_voucher_code":"","disabled_reason":null,"banner_info":{"msg":"","learn_more_msg":""}},"invalid_message":"","price_discount":0,"voucher_info":{"coin_earned":0,"voucher_code":null,"coin_percentage":0,"discount_percentage":0,"discount_value":0,"promotionid":0,"reward_type":0,"used_price":0},"coin_info":{"coin_offset":0,"coin_used":0,"coin_earn_by_voucher":0,"coin_earn":0},"card_promotion_id":null,"card_promotion_enabled":false,"promotion_msg":"","shop_voucher_entrances":[{"shopid":'$shopid',"status":true}]},"selected_payment_channel_data":{"version":2,"option_info":"","channel_id":8005200,"channel_item_option_info":{"option_info":"'$bank'"},"text_info":{}},"shoporders":[{"shop":{"shopid":'$shopid',"shop_name":"Duniagadgetku","cb_option":false,"images":"","is_official_shop":false,"remark_type":0,"support_ereceipt":false,"seller_user_id":44876013},"items":[{"itemid":'$itemid',"modelid":'$modl',"quantity":1,"item_group_id":0,"offerid":0,"insurances":[],"source":"","shopid":'$shopid',"shippable":true,"non_shippable_err":"","none_shippable_reason":"","none_shippable_full_reason":"","service_by_shopee_flag":false,"promotion_id":1265970891,"price":374900000000,"name":"Xiaomi Mi 11 lite 6/128Gb + 8/128GB Garansi Resmi","model_name":"[6/128] Black","add_on_deal_id":0,"is_add_on_sub_item":false,"is_pre_order":false,"is_streaming_price":false,"is_flash_sale":false,"image":"6dad8098bbbc4043c612a751b128610c","checkout":true,"categories":[{"catids":[100013,100073]}],"stock":0}],"tax_info":{"use_new_custom_tax_msg":false,"custom_tax_msg":"","custom_tax_msg_short":"","remove_custom_tax_hint":false},"tax_payable":0,"tax_exemption":0,"buyer_address_data":{"addressid":'$id',"address_type":0,"tax_address":""},"shipping_id":1,"shipping_fee_discount":0,"shipping_fee":2700000000,"selected_logistic_channelid":'$kurir',"order_total_without_shipping":374900000000,"order_total":377600000000,"logistics":{"integrated_channelids":[8003,8000,8002],"non_integrated_channelids":[],"voucher_wallet_checking_channel_ids":[8003],"logistic_channels":{"8000":{"channel_data":{"address_type":0,"cashless":1,"category":10008,"channelid":8000,"cod_supported":false,"display_name":"Instant","enabled":false,"extra_flag":0,"flag":8594403457,"is_mask_channel":1,"is_show_preferred_delivery_option":0,"maintenance":0,"min_amount_need_ic":0,"name":"Instant","need_check_ic":false,"priority":4,"shipping_method":8000,"warning":"max_distance_limit_exceeded","warning_msg":"Melebihi batas jarak pengiriman"},"cod_data":{"cod_available":false},"cost_info":{"cost":0,"discount_amount":0,"discount_promotion_rule_id":0,"discount_promotion_rule_snapshot_id":0,"discounted_shipping_fee":0,"discounts":{"seller":0,"shopee":0},"enjoy_discount":false,"estimated_shipping_fee":0,"original_cost":0,"rebate_promotion_rule_id":0},"cover_shipping_fee":false,"days_to_deliver":null,"shippability_info":null,"delivery_data":{"delay_message":"","max_days":null,"min_days":null},"guarantee_extension_period":null,"shipping_fee_data":{"chargeable_shipping_fee":0,"cod_fee":0,"shipping_fee_before_discount":0,"shipping_fee_detail":{"ITEM_TOTAL":0,"SHOPEE_OR_SELLER_SHIPPING_DISCOUNT":0,"SELLER_ONLY_SHIPPING_DISCOUNT":0,"SHIPPING_DISCOUNT_BY_SHOPEE":0,"SHIPPING_DISCOUNT_BY_SELLER":0,"BASIC_SHIPPING_FEE":0,"INSURANCE_FEE":0,"COD_FEE":0,"SELLER_ESTIMATED_BASIC_SHIPPING_FEE":0,"SELLER_ESTIMATED_INSURANCE_FEE":0,"shop_promo_only":true}},"preferred_delivery_instructions":{"options":[]}},"8002":{"channel_data":{"address_type":0,"cashless":1,"category":10008,"channelid":8002,"cod_supported":false,"display_name":"Next Day","enabled":false,"extra_flag":0,"flag":8590209153,"is_mask_channel":1,"is_show_preferred_delivery_option":1,"maintenance":0,"min_amount_need_ic":0,"name":"Next Day","need_check_ic":false,"priority":6,"shipping_method":8002,"warning":"shipping_option_unsupported","warning_msg":"Jasa kirim tidak didukung"},"cod_data":{"cod_available":false},"cost_info":{"cost":0,"discount_amount":0,"discount_promotion_rule_id":0,"discount_promotion_rule_snapshot_id":0,"discounted_shipping_fee":0,"discounts":{"seller":0,"shopee":0},"enjoy_discount":false,"estimated_shipping_fee":0,"original_cost":0,"rebate_promotion_rule_id":0},"cover_shipping_fee":false,"days_to_deliver":null,"shippability_info":null,"delivery_data":{"delay_message":"","max_days":null,"min_days":null},"guarantee_extension_period":null,"shipping_fee_data":{"chargeable_shipping_fee":0,"cod_fee":0,"shipping_fee_before_discount":0,"shipping_fee_detail":{"ITEM_TOTAL":0,"SHOPEE_OR_SELLER_SHIPPING_DISCOUNT":0,"SELLER_ONLY_SHIPPING_DISCOUNT":0,"SHIPPING_DISCOUNT_BY_SHOPEE":0,"SHIPPING_DISCOUNT_BY_SELLER":0,"BASIC_SHIPPING_FEE":0,"INSURANCE_FEE":0,"COD_FEE":0,"SELLER_ESTIMATED_BASIC_SHIPPING_FEE":0,"SELLER_ESTIMATED_INSURANCE_FEE":0,"shop_promo_only":true}},"preferred_delivery_instructions":{"options":[]}},"8003":{"channel_data":{"address_type":0,"cashless":1,"category":10008,"channelid":8003,"cod_supported":true,"display_name":"Reguler (Cashless)","enabled":true,"extra_flag":0,"flag":288230384754503800,"is_mask_channel":1,"is_show_preferred_delivery_option":1,"maintenance":0,"min_amount_need_ic":0,"name":"Reguler","need_check_ic":false,"priority":1,"shipping_method":8003,"warning":"","warning_msg":""},"cod_data":{"cod_available":false},"cost_info":{"cost":2700000000,"discount_amount":0,"discount_promotion_rule_id":0,"discount_promotion_rule_snapshot_id":0,"discounted_shipping_fee":2700000000,"discounts":{"seller":0,"shopee":0},"enjoy_discount":false,"estimated_shipping_fee":2700000000,"original_cost":2700000000,"rebate_promotion_rule_id":0},"cover_shipping_fee":false,"days_to_deliver":7,"shippability_info":null,"delivery_data":{"delay_message":"Pengiriman berpotensi mengalami keterlambatan dikarenakan PPKM","max_days":4,"min_days":2,"detail_info":{"apt":0.465903,"cdt_max":3.56,"cdt_min":1.78,"edt_max_dt":"2021-09-02","edt_min_dt":"2021-08-31","he_cdt":0,"he_pt":0},"display_mode":"edt_by_date","estimated_delivery_date_from":1630415684,"estimated_delivery_date_to":1630588484,"estimated_delivery_time_max":4,"estimated_delivery_time_min":2,"has_edt":true,"is_cross_border":false,"is_rapid_sla":false,"is_shopee_24h":false},"guarantee_extension_period":null,"shipping_fee_data":{"chargeable_shipping_fee":2700000000,"cod_fee":0,"shipping_fee_before_discount":2700000000,"shipping_fee_detail":{"ITEM_TOTAL":0,"SHOPEE_OR_SELLER_SHIPPING_DISCOUNT":-2000000000,"SELLER_ONLY_SHIPPING_DISCOUNT":0,"SHIPPING_DISCOUNT_BY_SHOPEE":0,"SHIPPING_DISCOUNT_BY_SELLER":0,"BASIC_SHIPPING_FEE":2700000000,"INSURANCE_FEE":0,"COD_FEE":0,"SELLER_ESTIMATED_BASIC_SHIPPING_FEE":0,"SELLER_ESTIMATED_INSURANCE_FEE":0,"shop_promo_only":true}},"preferred_delivery_instructions":{"options":[]},"preferred_delivery_time_info":{"alert_msg":"","options":[{"option_id":0,"name":"Pengiriman setiap saat","short_name":"Setiap Saat","description":"Disarankan untuk alamat rumah"},{"option_id":1,"name":"Pengiriman pada jam kantor","short_name":"Pada Jam Kantor","description":"Disarankan untuk alamat kantor"}]}}},"logistic_service_types":{"instant":{"channel_ids":[8000],"consolidated_logistic_info":{"enabled":false,"shop_promo_only_max_cost":0,"shop_promo_only_min_cost":0,"shopee_max_cost":0,"shopee_min_cost":0},"enabled":false,"identifier":"instant","max_cost":0,"min_cost":0,"name":"Instant","priority":1,"sla_msg":"Diterima 3 jam setelah paket diserahkan ke kurir"},"next_day":{"channel_ids":[8002],"consolidated_logistic_info":{"enabled":false,"shop_promo_only_max_cost":0,"shop_promo_only_min_cost":0,"shopee_max_cost":0,"shopee_min_cost":0},"enabled":false,"identifier":"next_day","max_cost":0,"min_cost":0,"name":"Next Day","priority":3,"sla_msg":"Diterima 1 hari setelah paket diserahkan ke kurir"},"regular":{"channel_ids":[8003],"consolidated_logistic_info":{"enabled":true,"shop_promo_only_max_cost":2700000000,"shop_promo_only_min_cost":2700000000,"shopee_max_cost":700000000,"shopee_min_cost":700000000},"enabled":true,"identifier":"regular","max_cost":2700000000,"min_cost":2700000000,"name":"Reguler","priority":4,"sla_msg":"Diterima 2-7 hari setelah paket diserahkan ke kurir"}}},"cod_fee":0,"buyer_remark":"","amount_detail":{"BASIC_SHIPPING_FEE":2700000000,"COD_FEE":0,"INSURANCE_FEE":0,"ITEM_TOTAL":374900000000,"SELLER_ESTIMATED_BASIC_SHIPPING_FEE":0,"SELLER_ESTIMATED_INSURANCE_FEE":0,"SELLER_ONLY_SHIPPING_DISCOUNT":0,"SHIPPING_DISCOUNT_BY_SELLER":0,"SHIPPING_DISCOUNT_BY_SHOPEE":2000000000,"SHOPEE_OR_SELLER_SHIPPING_DISCOUNT":-2000000000,"shop_promo_only":true,"TAX_EXEMPTION":0,"TAX_FEE":0,"VOUCHER_DISCOUNT":0},"selected_preferred_delivery_time_option_id":0,"buyer_ic_number":"","ext_ad_info_mappings":[]}],"shipping_orders":[{"shipping_id":1,"shoporder_indexes":[0],"selected_logistic_channelid":'$kurir',"selected_preferred_delivery_time_option_id":0,"buyer_remark":"","buyer_address_data":{"addressid":'$id',"address_type":0,"tax_address":""},"amount_detail":{"BASIC_SHIPPING_FEE":2700000000,"COD_FEE":0,"INSURANCE_FEE":0,"ITEM_TOTAL":374900000000,"SELLER_ESTIMATED_BASIC_SHIPPING_FEE":0,"SELLER_ESTIMATED_INSURANCE_FEE":0,"SELLER_ONLY_SHIPPING_DISCOUNT":0,"SHIPPING_DISCOUNT_BY_SELLER":0,"SHIPPING_DISCOUNT_BY_SHOPEE":2000000000,"SHOPEE_OR_SELLER_SHIPPING_DISCOUNT":-2000000000,"shop_promo_only":true,"TAX_EXEMPTION":0,"TAX_FEE":0,"VOUCHER_DISCOUNT":0},"cod_fee":0,"fulfillment_info":{"fulfillment_flag":64,"fulfillment_source":"","managed_by_sbs":false,"order_fulfillment_type":2,"warehouse_address_id":0},"order_total":377600000000,"order_total_without_shipping":374900000000,"selected_logistic_channelid_with_warning":null,"shipping_fee":2700000000,"shipping_fee_discount":0,"shipping_group_description":"","shipping_group_icon":"","shopee_shipping_discount_id":448133,"tax_payable":0,"tax_exemption":0,"voucher_wallet_checking_channel_ids":[8003],"is_fsv_applied":false,"buyer_ic_number":""}],"fsv_selection_infos":[],"buyer_txn_fee_info":{"title":"Biaya Penanganan","description":"Besar biaya penanganan adalah Rp1.000 dari total transaksi.","learn_more_url":"https://shopee.co.id/events3/code/634289435/"},"disabled_checkout_info":{"description":"","auto_popup":false,"error_infos":[]},"can_checkout":true,"_cft":[3],"device_info":{"device_sz_fingerprint":"9ZRqlguVgxvPUFKiCdQ1rw==|Lv0eerWaf/BLIfAR8kS8P4aIPDVmCzicQtDLqMvorblucKTNk/PtwlLCO4FVKA9UkbwpNzHZx4WFglEB1w==|P1dy5wpFrskn+6VS|03|3"},"captcha_version":1}' \
  --compressed -s)
#{"checkoutid":83561210676291,"redirect_url":"https://shopee.co.id/payment/6117917165152500927?to_local_spm=0&__mobile__=1?allow_change_payment_method=1","timestamp":1629862010,"has_non_shippable_item":false,"payment_type":2,"orderids":[83561210686525],"is_group_buy":false,"group_buy_groupid":0,"is_shopee_cod":false,"navigation_info":{"type":1,"data":{}},"cmo_req_msg":null}
#{"error":"error_params","error_msg":"Beberapa informasi produk pada pesanan Anda telah diperbarui, mohon kembali ke halaman keranjang dan coba lagi."}
echo place2 $plsorder1
echo
}


getsessions(){
  echo -e "\033[41mMasukan Nomor 62***********\033[m"
  read -p "Masukan Nomor : " nomor
  get
  login1
  login2
  send
  status1 &
  otp
  resendotp
  status2
  verify
  last2
}
sesilogin(){
  echo -e "\033[41mPilih Sessions Login\033[m"
  echo
  ls sessions
  read -p "Salin Sessions : " ssns
  SPC_EC2=$(cat sessions/$ssns | awk -F"SPC_EC" '{print $2}' | awk -F"\t" '{print $2}' | sed '/^\s*$/d' | sed 's/"//g')
  address
  echo
  echo "=============================================================="
  echo -e "\e[33;1mAddress Account\e[0m"
  echo "userid    : $userid"
  echo "name      : $name"
  echo "phone     : $phone"
  echo "Provinsi  : $state"
  echo "Kabubaten : $city"
  echo "Distrik   : $district"
  echo "Alamat    : $address"
  echo "=============================================================="
  models
  echo -e "\e[33;1m$namabarang\e[0m"
  echo "1. ${aqila[0]}"
  echo "2. ${aqila[1]}"
  echo "3. ${aqila[2]}"
  read -p "Masukan Model : " tylr
  case $tylr in
    1)  modl=${aqila[0]}
    ;;
    2)  modl=${aqila[1]}
    ;;
    3)  modl=${aqila[2]}
    ;;
  esac
  echo
  echo -e "\e[33;1mPilih Perintah Eksekusi\e[0m"
  echo "1. addcart-get-place"
  echo "2. addcart-place"
  echo "3. "
  read -p "Pilih eksekusi : " taylor
  echo
  case $taylor in
    1) addcart-get-place
    ;;
    2) addcart-place
    ;;
    3)
    ;;
  esac
}
loginmobile(){
  echo -e "\033[41mMasukan Nomor 62***********\033[m"
  read -p "Masukan Nomor : " nomor
  get
  login1
  login2
  send
  status1 &
  otp
  resendotp
  status2
  verify
  last1
  address
  echo
  echo "=============================================================="
  echo -e "\e[33;1mAddress Account\e[0m"
  echo "userid    : $userid"
  echo "name      : $name"
  echo "phone     : $phone"
  echo "Provinsi  : $state"
  echo "Kabubaten : $city"
  echo "Distrik   : $district"
  echo "Alamat    : $address"
  echo "=============================================================="
  models
  echo -e "\e[33;1m$namabarang\e[0m"
  echo "1. ${aqila[0]}"
  echo "2. ${aqila[1]}"
  echo "3. ${aqila[2]}"
  read -p "Masukan Model : " tylr
  case $tylr in
    1)  modl=${aqila[0]}
    ;;
    2)  modl=${aqila[1]}
    ;;
    3)  modl=${aqila[2]}
    ;;
  esac
  echo
  echo -e "\e[33;1mPilih Perintah Eksekusi\e[0m"
  echo "1. addcart-get-place"
  echo "2. addcart-place"
  echo "3. "
  read -p "Pilih eksekusi : " taylor
  echo
  case $taylor in
    1) addcart-get-place
    ;;
    2) addcart-place
    ;;
    3)
    ;;
  esac
}


addcart-get-place(){
  echo -e "\e[33;1mPilih Kurir\e[0m"
  echo "1. Reguler"
  echo "2. Hemat"
  echo "3. Kargo"
  read -p "Masukan Kurir : " krr
  case $krr in
    1)  kurir=8003
    ;;
    2)  kurir=8005
    ;;
    3)  kurir=80008
    ;;
  esac
  echo
  echo -e "\e[33;1mPilih Bank\e[0m"
  echo "1. BCA"
  echo "2. Mandiri"
  echo "3. BNI"
  echo "4. BRI"
  echo "5. Syariah Indo"
  echo "6. Permata"
  read -p "Masukan Bank : " bnk
  case $bnk in
    1)  bank=89052001
    ;;
    2)  bank=89052002
    ;;
    3)  bank=89052003
    ;;
    4)  bank=89052004
    ;;
    5)  bank=89052005
    ;;
    6)  bank=89052006
    ;;
  esac
  echo
  echo "contoh 115959"
  read -p "Masukan Jam fs : " jamfs
  echo "=============================================================="
  echo "Sedang menunggu kecocokan jam dengan FlashSale...."
for (( ; ; )); do
  time=$(date +%T)
  time=${time//:/}
  if [ $time = $jamfs ]; then
  break
  fi
done
  addcart
  get
  place1
}
addcart-place(){
  echo -e "\e[33;1mPilih Kurir\e[0m"
  echo "1. Reguler"
  echo "2. Hemat"
  echo "3. Kargo"
  read -p "Masukan Kurir : " krr
  case $krr in
    1)  kurir=8003
    ;;
    2)  kurir=8005
    ;;
    3)  kurir=80008
    ;;
  esac
  echo
  echo -e "\e[33;1mPilih Bank\e[0m"
  echo "1. BCA"
  echo "2. Mandiri"
  echo "3. BNI"
  echo "4. BRI"
  echo "5. Syariah Indo"
  echo "6. Permata"
  read -p "Masukan Bank : " bnk
  case $bnk in
    1)  bank=89052001
    ;;
    2)  bank=89052002
    ;;
    3)  bank=89052003
    ;;
    4)  bank=89052004
    ;;
    5)  bank=89052005
    ;;
    6)  bank=89052006
    ;;
  esac
  echo
  echo -e "\e[33;1mOngkir & Harga\e[0m"
  read -p "Masukan Ongkir : " ongkir
  read -p "Masukan Harga Barang : " harga
  total=$(( $ongkir + $harga ))
  echo "contoh 115959"
  read -p "Masukan Jam fs : " jamfs
  echo "=============================================================="
  echo "Sedang menunggu kecocokan jam dengan FlashSale...."
for (( ; ; )); do
  time=$(date +%T)
  time=${time//:/}
  if [ $time = $jamfs ]; then
  break
  fi
done
addcart
place2
}

itemid=8041443507
shopid=51925611
url=ErwXtwpy9hYJltHEBUbuzD2PBBmMZNNU
echo
echo -e "\033[41mBot Shopee v.3.0 Rab 25 Agu 2021 By.Syailndraa\033[m"
echo
echo -e "\e[33;1mPilih Sesi Login\e[0m"
echo "1. getsessions"
echo "2. sesilogin"
echo "3. loginmobile"
read -p "Choose Login : " poli
echo
case $poli in
  1) getsessions
  ;;
  2) sesilogin
  ;;
  3) loginmobile
  ;;
esac
