" Recommended plugins:
" Rails.vim: https://github.com/tpope/vim-rails

" Rails.vim

" :Rfac item
autocmd User Rails Rnavcommand factory    spec/factories   -glob=**/* -suffix=_factory.rb

" :Rfab item
autocmd User Rails Rnavcommand fabricator spec/fabricators -glob=**/* -suffix=_fabricator.rb

" :A on lib/foo.rb -> unit/lib/foo_spec.rb
autocmd User Rails/lib/* let b:rails_alternate = 'unit/' . rails#buffer().name()[0:-4] . '_spec.rb'

" :A on unit/lib/foo_spec.rb -> lib/foo.rb
autocmd User Rails/unit/lib/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'

" :A on engines/foo/bar.rb -> {spec,unit}/engines/foo/bar_spec.rb
autocmd User Rails/engines/* let common = rails#buffer().name()[0:-4].'_spec.rb' | let spec = 'spec/'.common | let unit = 'unit/'.common | let b:rails_alternate = filereadable(spec) ? spec : unit

" :A on spec/engines/foo/bar_spec.rb -> engines/foo/bar.rb
autocmd User Rails/spec/engines/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'

" :A on unit/engines/foo/bar_spec.rb -> engines/foo/bar.rb
autocmd User Rails/unit/engines/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'
