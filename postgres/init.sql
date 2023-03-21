/*
    Inserting a few demo users into the database, and returning their id-s;

    NOTES:

    - You can do multiple separate inserts, if you want, but using
      a single concatenated insert is significantly faster.

    - We only add schema here to demonstrate the ability of class QueryFile
      to pre-format SQL with static formatting parameters when needs to be.

    See also:
    https://github.com/vitaly-t/pg-promise/wiki/Performance-Boost

*/

CREATE TABLE public.users
(
    user_id SERIAL NOT NULL,
    first_name character varying(100) NOT NULL,
    email character varying(100) UNIQUE NOT NULL,        
    password character varying(200),
    PRIMARY KEY (user_id)
);
