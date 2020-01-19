DO
$$DECLARE
    v_database varchar := 'roads';
    v_schema varchar := 'roads';
    v_table varchar := 'motorwayjunction';
    v_column varchar := 'geom';
    v_type varchar := 'GIST';
    v_index_name varchar := 'idx_geom_motorwayjunction';
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relname = v_index_name AND n.nspname = v_schema) THEN
        RAISE INFO 'Adding index %', v_index_name;
        -- E.g. CREATE INDEX idx_name_btree ON foo.bar USING btree(name);
        EXECUTE 'CREATE INDEX ' || v_index_name || ' ON ' || v_schema || '.' || v_table || ' USING ' || v_type || '(' || v_column || ');';
    ELSE
        RAISE INFO 'INDEX % already exists on table %.%', v_index_name, v_schema, v_table;
    END IF;
END$$;

DO
$$DECLARE
    v_database varchar := 'roads';
    v_schema varchar := 'roads';
    v_table varchar := 'roadnode';
    v_column varchar := 'geom';
    v_type varchar := 'GIST';
    v_index_name varchar := 'idx_geom_roadnode';
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relname = v_index_name AND n.nspname = v_schema) THEN
        RAISE INFO 'Adding index %', v_index_name;
        -- E.g. CREATE INDEX idx_name_btree ON foo.bar USING btree(name);
        EXECUTE 'CREATE INDEX ' || v_index_name || ' ON ' || v_schema || '.' || v_table || ' USING ' || v_type || '(' || v_column || ');';
    ELSE
        RAISE INFO 'INDEX % already exists on table %.%', v_index_name, v_schema, v_table;
    END IF;
END$$;

DO
$$DECLARE
    v_database varchar := 'roads';
    v_schema varchar := 'roads';
    v_table varchar := 'roadlink';
    v_column varchar := 'geom';
    v_type varchar := 'GIST';
    v_index_name varchar := 'idx_geom_roadlink';
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relname = v_index_name AND n.nspname = v_schema) THEN
        RAISE INFO 'Adding index %', v_index_name;
        -- E.g. CREATE INDEX idx_name_btree ON foo.bar USING btree(name);
        EXECUTE 'CREATE INDEX ' || v_index_name || ' ON ' || v_schema || '.' || v_table || ' USING ' || v_type || '(' || v_column || ');';
    ELSE
        RAISE INFO 'INDEX % already exists on table %.%', v_index_name, v_schema, v_table;
    END IF;
END$$;

DO
$$DECLARE
    v_database varchar := 'roads';
    v_schema varchar := 'roads';
    v_table varchar := 'roadlink';
    v_column varchar := 'identifier';
    v_type varchar := 'btree';
    v_index_name varchar := 'idx_identifier_roadlink';
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relname = v_index_name AND n.nspname = v_schema) THEN
        RAISE INFO 'Adding index %', v_index_name;
        -- E.g. CREATE INDEX idx_name_btree ON foo.bar USING btree(name);
        EXECUTE 'CREATE INDEX ' || v_index_name || ' ON ' || v_schema || '.' || v_table || ' USING ' || v_type || '(' || v_column || ');';
    ELSE
        RAISE INFO 'INDEX % already exists on table %.%', v_index_name, v_schema, v_table;
    END IF;
END$$;

DO
$$DECLARE
    v_database varchar := 'roads';
    v_schema varchar := 'roads';
    v_table varchar := 'roadlink';
    v_column varchar := 'name1';
    v_type varchar := 'btree';
    v_index_name varchar := 'idx_name1_roadlink';
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relname = v_index_name AND n.nspname = v_schema) THEN
        RAISE INFO 'Adding index %', v_index_name;
        -- E.g. CREATE INDEX idx_name_btree ON foo.bar USING btree(name);
        EXECUTE 'CREATE INDEX ' || v_index_name || ' ON ' || v_schema || '.' || v_table || ' USING ' || v_type || '(' || v_column || ');';
    ELSE
        RAISE INFO 'INDEX % already exists on table %.%', v_index_name, v_schema, v_table;
    END IF;
END$$;