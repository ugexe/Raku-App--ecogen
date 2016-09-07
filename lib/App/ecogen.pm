unit module App::ecogen;

sub from-json($text) is export {
    INIT my $INTERNAL_JSON = (so try { ::("Rakudo::Internals::JSON") !~~ Failure }) == True;
    $INTERNAL_JSON
        ?? ::("Rakudo::Internals::JSON").from-json($text)
        !! do {
            my $a = ::("JSONPrettyActions").new();
            my $o = ::("JSONPrettyGrammar").parse($text, :actions($a));
            JSONException.new(:$text).throw unless $o;
            $o.ast;
        }
}

sub to-json(|c) is export {
    INIT my $INTERNAL_JSON = (so try { ::("Rakudo::Internals::JSON") !~~ Failure }) == True;
    $INTERNAL_JSON
        ?? ::("Rakudo::Internals::JSON").to-json(|c)
        !! &::("to-json").(|c);
}
