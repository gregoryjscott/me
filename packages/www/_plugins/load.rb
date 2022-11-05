module Jekyll
    module Load
      class Loader < Jekyll::Generator
  
        priority :high
  
        def generate(site)
          @site = site
          Dir.chdir(@site.source) { load_pages }

          a = `npm run hook`
          puts a

          Jekyll.logger.error "Hello, world"
        end
  
        def load_pages
          data_files = Dir[File.join('_data', '**', '*.yml')]
          data_files.each do |data_file|
            page = find_page(data_file)
            data = YAML.load_file(data_file)
            unless page.nil?
              data = merge_data page, data
            #   add_to_index data_file, data unless is_index data_file
            end
          end
        end
  
        def merge_data(page, data)
          page.data.merge! data
          page.data['url'] = page.url
          page.data
        end
  
        def find_page(data_file)
          path = data_file.gsub("_data#{File::SEPARATOR}", '').gsub('.yml', '.md')
          @site.pages.detect { |page| page.path == path }
        end
  
        # def add_to_index(data_file, data)
        #   page = find_corresponding_index data_file
        #   page.data['items'] = [] if page.data['items'].nil?
        #   page.data['items'].push data
        # end
  
        # def find_corresponding_index(data_file)
        #   path = 'index.md'
        #   nesting = data_file.match(/_data\/(?<resource>.+)\//)
        #   path = File.join nesting[1], path unless nesting.nil?
        #   page = @site.pages.detect { |page| page.path == path }
        # end
  
        # def is_index(data_file)
        #   data_file.end_with? 'index.yml'
        # end
  
      end
    end
  end