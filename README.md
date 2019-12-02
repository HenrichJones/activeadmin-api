# Activeadmin - API

## Technologies

* Ruby 2.6.4
* Rails 6.0.1
* PostgreSQL 9.4+

## Setup

**1. Environment Dependencies**

- Ruby: recommend to use some version manager like [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv) 

**2. Environment Variables**

- Create a file named `database.yml` on the config of the project with the following content and replace with your the database info.

**3. Database**

- You must add the database variables on .env described above.
Create a database directly on **PostgreSQL** (with psql) or use:
```
  rails db:create // create a default database following .env
```
After that run:

```
  rails db:migrate // add tables
```

After create database using rails db:create you can run

```
  rails db:seed // populate database with some objects
```

**4. Bundle**

	bundle install
	
**5. Run aplication**
```
  rails s
```

**6. API link on heroku**

- [activeadmin-api Herokuapp](https://activeadmin-api.herokuapp.com/api/v1/dashboard)

**5. Database Model**
![](https://i.imgur.com/lLfmONK.png)
