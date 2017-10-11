require 'spec_helper'
require 'json'

RSpec.describe Jkeeper do
    it "has a version number" do
        expect(Jkeeper::VERSION).not_to be nil
    end

    # .json 파일 불러오기
    describe "can load json file" do
        dataArray = Jkeeper::Filer.read 'spec/test/data.json'
        dataHash  = Jkeeper::Filer.read 'spec/test/one_data.json'

        it "데이터가 존재하는 파일을 정상적으로 불러온다" do
            expect(dataArray).not_to be nil
            expect(dataHash).not_to be nil
        end

        it "불러와서 Ruby 자료형으로 변환한다" do
            expect([dataArray.class.to_s, dataHash.class.to_s]).to eq(%w(Array Hash))
        end
    end

    # 데이터를 파일로 저장하기
    describe "can save data file" do
        describe "자료형에 관계 없이 형태를 유지하며 json으로 저장한다" do
            hash  = {success: true}
            array = [{success: true}, {success: true}, {success: true}]
            json  = JSON.pretty_generate({success: true})

            path_h = Jkeeper::Filer.save_json(hash, filename: 'h', filepath: 'spec/test/')
            path_a = Jkeeper::Filer.save_json(array, filename: 'a', filepath: 'spec/test/')
            path_j = Jkeeper::Filer.save_json(json, filename: 'j', filepath: 'spec/test/', already_json: true)

            data_h = Jkeeper::Filer.read path_h
            data_a = Jkeeper::Filer.read path_a
            data_j = Jkeeper::Filer.read path_j

            it "- hash" do
                expect(data_h).to eq(hash)
            end
            `rm -rf spec/test/a.json`

            it "- array" do
                expect(data_a).to eq(array)
            end
            `rm -rf spec/test/h.json`

            it "- json" do
                expect(data_j).to eq(JSON.parse(json, symbolize_names: true))
            end
            `rm -rf spec/test/j.json`
        end

    end
end
