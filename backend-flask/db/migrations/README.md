### Trigger Bio


- [migration](16824548085333924_add_bio_column.py)
- [migrate](../../../bin/db/migrate) 

```SQL
CREATE TABLE IF NOT EXISTS public.schema_information (
  id integer UNIQUE,
  last_successful_run text
);
```




**Developer Reference**

Insert Bio:
```SQL
ALTER TABLE public.users ADD COLUMN bio text;
```

Delete Bio:
```SQL
        ALTER TABLE public.users DROP COLUMN bio;
```


```SQL
SELECT * FROM public.schema_information LIMIT 1;
```

```SQL
   SELECT last_successful_run FROM public.schema_information LIMIT 1;
```


List users properties :
```SQL
\d users;
```


**Troublshoot**
```SQL
UPDATE schema_information SET LAST_successful_run =0;
```
- [rollback](../../../bin/db/migrate) and get bio away




`.keep` to keep the directory lol.