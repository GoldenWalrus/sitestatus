$(function() {
var sites = ["google.com","youtube.com","facebook.com","yahoo.com","amazon.com",
	"wikipedia.com","twitter.com", "reddit.com","ebay.com","linkedin.com","apple.com","microsoft.com"];
$("#query").autocomplete({source: sites});
});
