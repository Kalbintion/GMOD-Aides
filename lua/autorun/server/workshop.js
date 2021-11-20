var list = [];
jQuery(".collectionItemDetails").children("a").each(function(k,v) {
	var id = v.href.split("/")[5].replace("?id=", "");
	list.push(Number(id));
});
JSON.stringify(list).replace("[", "{").replace("]", "}");
