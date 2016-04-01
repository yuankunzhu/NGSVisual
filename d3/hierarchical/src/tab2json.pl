#!/use/bin/perl
use List::MoreUtils qw(uniq);
open IN, $ARGV[0];
print "[\n";
while (<IN>) {
	next if $.==1;
	$read_line=$_;
	($group, $sample, $seqType, $tumor, $pipeline, $user)=split;
	$hash_group{$group}.=$read_line;
	$hash_sample{$sample}.=$read_line;
	$hash_seqType{$seqType}.=$read_line;
	$hash_tumor{$tumor}.=$read_line;
	#each_piepline
	@each_pipeline = split(/\,/,$pipeline);
	foreach(@each_pipeline){$hash_pipeline{$_}.=$read_line;}
	#each_user
	@each_user = split(/\,/, $user);
	foreach(@each_user){$hash_user{$_}.=$read_line;}
}

foreach $GROUP (keys %hash_group){
	$size_num+=1;
	@content=split("\n",$hash_group{$GROUP});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"group.$GROUP",
		"size":$size_num,
		"imports":[
			"sample.$uniq_sample",
			"seqType.$uniq_seqType",
			"user.$uniq_user",
			"tumor.$uniq_tumor"
		]
	},
JSON
	print $json;
}

foreach $SAMPLE (keys %hash_sample){
	$size_num+=1;
	@content=split("\n",$hash_sample{$SAMPLE});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"sample.$SAMPLE",
		"size":$size_num,
		"imports":[
			"seqType.$uniq_seqType",
			"tumor.$uniq_tumor",
			"pipeline.$uniq_pipeline"
		]
	},
JSON
	print $json;
}

foreach $SEQTYPE (keys %hash_seqType){
	$size_num+=1;
	@content=split("\n",$hash_seqType{$SEQTYPE});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"seqType.$SEQTYPE",
		"size":$size_num,
		"imports":[
		]
	},
JSON
	print $json;
}

foreach $TUMOR (keys %hash_tumor){
	$size_num+=1;
	@content=split("\n",$hash_tumor{$TUMOR});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"tumor.$TUMOR",
		"size":$size_num,
		"imports":[
		]
	},
JSON
	print $json;
}

foreach $PIPELINE (keys %hash_pipeline){
	$size_num+=1;
	@content=split("\n",$hash_pipeline{$PIPELINE});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"pipeline.$PIPELINE",
		"size":$size_num,
		"imports":[
		]
	},
JSON
	print $json;
}

foreach $USER (keys %hash_user){
	$size_num+=1;
	@content=split("\n",$hash_user{$USER});
	foreach $each_line (@content){
		($group, $sample, $seqType, $tumor, $pipeline, $user)=split(/\t/,$each_line);
		push @temp_group, $group;
		push @temp_sample, $sample;
		push @temp_seqType, $seqType;
		push @temp_tumor, $tumor;
		@each_pipeline = split(/\,/,$pipeline);
		foreach(@each_pipeline){push @temp_pipeline, $_}
		@each_user = split(/\,/, $user);
		foreach(@each_user){push @temp_user, $_}
	}
	$uniq_group = join("\",\"group.", (uniq @temp_group));
	$uniq_sample = join("\",\"sample.", (uniq @temp_sample));
	$uniq_seqType = join("\",\"seqType.", (uniq @temp_seqType));
	$uniq_tumor = join("\",\"tumor.", (uniq @temp_tumor));
	$uniq_pipeline = join("\",\"pipeline.", (uniq @temp_pipeline));
	$uniq_user = join("\",\"user.", (uniq @temp_user));
	@temp_group = ();
	@temp_sample = ();
	@temp_seqType = ();
	@temp_tumor = ();
	@temp_pipeline = ();
	@temp_user = ();

	$json =<<JSON;
	{
		"name":"user.$USER",
		"size":$size_num,
		"imports":[
		]
	},
JSON
	print $json;
}
$size_num+=1;
$end =<<JSON;
	{
		"name":"",
		"size":$size_num,
		"imports":[
		]
	}
]
JSON
print $end;

