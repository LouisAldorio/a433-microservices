# menspesifikasikan base image yang digunakan
FROM node:14-alpine

# menspesifikasikan direktori kerja
WORKDIR /app

# menyalin seluruh file yang ada di direktori ini ke direktori kerja
COPY . .

# memberikan default environment variable
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# menspesifikasikan port yang akan digunakan
EXPOSE 8080

# menjalankan aplikasi
CMD ["npm", "start"]

