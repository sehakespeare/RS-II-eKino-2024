﻿## eKino

## Kredencijali za prijavu

- Administrator (Desktop)

  ```
  Korisnicko ime: admin
  Password: admin
  ```
- Client (Mobile)

  ```
  Korisnicko ime: Client1
  Password: client
  ```

#### Kredencijali za placanje

  ```
  Broj kartice: 4242 4242 4242 4242
  ```

#### NAPOMENA
  ```
  Report I u desktop dijelu testirati preko filma "Love in the Villa".
  ```

## Pokretanje aplikacija
1. Kloniranje repozitorija
  ```
  https://github.com/sehakespeare/RS-II-eKino-2024.git
  ```
2. Otvoriti klonirani repozitorij u konzoli
3. Pokretanje dokerizovanog API-ja i DB-a
  ```
  docker-compose build
  docker-compose up
  ```
4. Otvoriti eKino folder
  ```
  cd eKino
  ```
5. Otvoriti ekinomobile folder
  ```
  cd ekinomobile
  ```
6. Dohvatanje dependency-a
  ```
  flutter pub get
  ```
7. Pokretanje mobilne aplikacije
  ```
  flutter run
  ```
8. Pokretanje desktop aplikacije
  ```
  1. Za pokretanje desktop aplikacije ponoviti iste korake kao za mobilnu.
  ```
  
