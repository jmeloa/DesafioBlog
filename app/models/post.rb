class Post < ApplicationRecord
    before_save :censorship_words

    def censorship_words
        forbidden_words = ["spoiler", "Spoiler", "SPOILER"]
        forbidden_words.each do |word|

            Rails.logger.info("################# ERASING FORBIDDEN WORDS ##################")
            Rails.logger.info("#{word}")

            temp_word = self.content.partition(/#{Regexp.quote(word)}/)

            Rails.logger.info("#{temp_word}")
            Rails.logger.info("#################                         ##################")
            
            if temp_word[1] != ""
                self.content = temp_word[0].concat(temp_word[-1])
            end
        end
    end


end
