# HOW TO RUN TRAVELSAVE API

> > Requirements: Docker Desktop, PostgreSQL

1. Clone repo

2. Open powershell and navigate to the project directory

3. Run: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
`

4. Run the scipt: `.\docker-manage.psl`

5. Run: `docker ps` to check containers are running _(TravelSaveApi, TravelSaveDb)_

6. Access api in browser through the link: (http://localhost/5000/swagger)

7. To stop containers, run: `docker stop TravelSaveApi TravelSaveDb`

Feel Free to Report a bug
