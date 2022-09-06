## App::ecogen

Generate an index from cpan and the p6c ecosystem

See: https://github.com/ugexe/Perl6-ecosystems

## Installation

    $ zef install App::ecogen

## Usage

    # Create, save, and push cpan package index
    ecogen update cpan

    # Create, save, and push p6c ecosystem package index
    ecogen update p6c

    # Create, save, and push both cpan and p6c ecosystem package indexes
    ecogen update cpan p6c
