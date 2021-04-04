server {
    server_name theatreapi.saileshkumar.com www.theatreapi.saileshkumar.com;
    
    location / {
        proxy_pass http://127.0.0.1:3000;
	    proxy_set_header X-Forwarded-Proto https;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        proxy_redirect off;
     }
}
