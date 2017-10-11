require 'json'
require 'rest-client'
require "jkeeper/version"

module Jkeeper

    module Filer
        def self.save_json(data, fileconf={time: false, filename: nil, filepath: './', already_json: false})

            time = ''
            time += Time.new.strftime('%F-%H%M%S') if fileconf[:time] || fileconf[:filename].nil?

            filename = time + '.json'
            filename = fileconf[:filename].gsub('.json','') + time + '.json' if fileconf[:filename]

            if fileconf[:filepath]
                filepath = fileconf[:filepath]
            else
                filepath = './keep_set'
            end

            json = fileconf[:already_json] ? data : JSON.pretty_generate(data)
            path = filepath+filename
            File.write(path, json)

            puts "file saved in #{File.dirname(path)}"
            path
        end

        def self.read path
            file = File.read(path)
            JSON.parse(file, symbolize_names: true)
        end
    end

    module Api

        # Usage
        #
        # Jkeeper::Api.get('https://openapi.naver.com/v1/map/geocode',
        #               {
        #                   key: ['X-Naver-Client-Id', 'YOUR_APP_KEY'],
        #                   secret: ['X-Naver-Client-Secret', 'YOUR_APP_SECRET']
        #               },
        #               '서울시 중구 필동')
        def self.get(url, meta={key: ['',''], secret: ['','']}, *params)
            key_label, key_content = meta[:key][0], meta[:key][1]
            sec_label, sec_content = meta[:secret][0], meta[:secret][1]

            json = RestClient.get(url, params: { query: params.join(',') },
                                  "#{key_label}": key_content,
                                  "#{sec_label}": sec_content)
            JSON.parse(json, symbolize_names: true)
        end

    end
end
