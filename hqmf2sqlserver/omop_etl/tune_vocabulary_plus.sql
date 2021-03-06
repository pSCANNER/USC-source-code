:r "C:\Ephir\hqmf2sql\omop_etl\defaults.sql"
--set search_path = :vocab_schema;
--cluster vocabulary_extras using vocabulary_extras_pkey;
--vacuum analyze vocabulary_extras;
-- The name of the schema that has your vanilla OMOP vocabulary tables (vocabulary, concept, etc.):

--create index concept_vocab_code_idx on concept_extras(vocabulary_id,concept_code);
EXEC ('create clustered index concept_vocab_code_idx on '+@vocab_schema+'.concept_extras(vocabulary_id,concept_code);');
--cluster concept_extras using concept_vocab_code_idx;
--create index concept_concept_code_idx on concept_extras(concept_code);
EXEC ('create index concept_concept_code_idx on '+@vocab_schema+'.concept_extras(concept_code);');
--create index concept_concept_code_vocab_id_idx on concept_extras(concept_code,vocabulary_id);
EXEC ('create index concept_concept_code_vocab_id_idx on '+@vocab_schema+'.concept_extras(concept_code,vocabulary_id);');
--create index xcoc_id_lev on concept_extras(concept_id,concept_level);
EXEC ('create index xcoc_id_lev on '+@vocab_schema+'.concept_extras(concept_id,concept_level);');
--create index xcon_2cd on concept_extras(concept_class,concept_id);
EXEC ('create index xcon_2cd on '+@vocab_schema+'.concept_extras(concept_class,concept_id);');
--create index xcon_2id on concept_extras(vocabulary_id,concept_id);
EXEC ('create index xcon_2id on '+@vocab_schema+'.concept_extras(vocabulary_id,concept_id);');
--create index xcon_3cd on concept_extras(vocabulary_id,concept_class,concept_id);
EXEC ('create index xcon_3cd on '+@vocab_schema+'.concept_extras(vocabulary_id,concept_class,concept_id);');
--vacuum analyze concept_extras;
--create index x_an_an on concept_ancestor_extras(ancestor_concept_id);
EXEC ('create index x_an_an on '+@vocab_schema+'.concept_ancestor_extras(ancestor_concept_id);');
--create index x_an_d on concept_ancestor_extras(descendant_concept_id);
EXEC ('create index x_an_d on '+@vocab_schema+'.concept_ancestor_extras(descendant_concept_id);');
--vacuum analyze concept_ancestor_extras;

EXEC('create clustered index xid12 on '+@vocab_schema+'.concept_relationship_extras(concept_id_1,concept_id_2);');

--EXEC ('create index concept_concept_code_idx on '+@vocab_schema+'.concept_extras(concept_code);');
--create index xid21 on concept_relationship_extras(concept_id_2,concept_id_1);
--cluster concept_relationship_extras using xid12;
--vacuum analyze concept_relationship_extras;
--cluster relationship_extras using relationship_extras_pkey;
--vacuum analyze relationship_extras;
--create index source_to_concept_map_source_idx on source_to_concept_map_extras(source_vocabulary_id,source_code,target_vocabulary_id);
EXEC ('create clustered index source_to_concept_map_source_idx on '+@vocab_schema+'.source_to_concept_map_extras(source_vocabulary_id,source_code,target_vocabulary_id);');
--cluster source_to_concept_map_extras using source_to_concept_map_source_idx;
--create index source_to_concept_map_source_code_source_vocabulary_id_targ_idx   on source_to_concept_map_extras(source_code, source_vocabulary_id, target_vocabulary_id)   WHERE invalid_reason IS NULL AND primary_map = 'Y';
EXEC ('create index source_to_concept_map_source_code_source_vocabulary_id_targ_idx on '+@vocab_schema+'.source_to_concept_map_extras(source_code, source_vocabulary_id, target_vocabulary_id);');
--vacuum analyze source_to_concept_map_extras;
