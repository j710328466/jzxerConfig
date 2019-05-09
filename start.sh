echo $1 > /tmp/temp
curl 'https://oapi.dingtalk.com/robot/send?access_token=200a5dd7f595b5afee3e7fe427915ea216fb39ebd9ad0447d037500378b495d9' \
   -H 'Content-Type: application/json' \
   -d '{"msgtype": "text", 
        "text": {
             "content": `cat /tmp/temp`
        }
      }'