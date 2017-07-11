class Driver < ActiveRecord::Base

  validates :name, presence: true
  validates :mobile, presence: true
  validates :fleet_id, presence: true
  validates :id_card, presence: true

  def self.search params

    if params['search_str'].blank?
      return drivers = where(:enabled => true)
    end

    search_text = "%#{params['search_str']}%"

    case params['tag']
      when "1"
        drivers = where(" name like ?", search_text).where(:enabled => true)
      when "2"
        drivers = where(" mobile like ?", search_text ).where(:enabled => true)
      when "3"
        drivers = where(" fleet_id like ?", search_text ).where(:enabled => true)
      when "4"
        drivers = where(" id_card like ?", search_text ).where(:enabled => true)
      when "0"
        drivers = where(
            "name like ? or mobile like ? or fleet_id like ? or id_card like ?",
            search_text, search_text, search_text, search_text
        ).where(:enabled => true)
      else
        drivers = where(:enabled => true)
    end

    drivers
  end

end
