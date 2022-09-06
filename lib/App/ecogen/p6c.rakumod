use App::ecogen;


class App::ecogen::p6c does Ecosystem {
    has $.prefix;
    has $!meta-list-uri = 'https://raw.githubusercontent.com/raku/ecosystem/main/META.list';

    method IO { self.prefix.IO }

    method meta-uris { @ = self.slurp-http($!meta-list-uri).lines }
}
