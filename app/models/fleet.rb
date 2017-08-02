class Fleet < ActiveRecord::Base

  validates :name, presence: true
  validates :manager, presence: true
  validates :mobile, presence: true
  #validates :enabled, presence: true

  has_many :dirvers

  def self.search params

    if params['search_str'].blank?
      return fleets = where(:enabled => true)
    end

    search_text = "%#{params['search_str']}%"

    case params['tag']
      when "1"
        fleets = where(" name like ?", search_text).where(:enabled => true)
      when "2"
        fleets = where(" manager like ?", search_text ).where(:enabled => true)
      when "3"
        fleets = where(" mobile like ?", search_text ).where(:enabled => true)
      when "4"
        fleets = where(" office_number like ?", search_text ).where(:enabled => true)
      when "5"
        fleets = where(" location like ?", search_text ).where(:enabled => true)
      when "0"
        fleets = where(
          "name like ? or manager like ? or mobile like ? or office_number like ? or location like ?",
          search_text, search_text, search_text, search_text, search_text
        ).where(:enabled => true)
      else
        fleets = where(:enabled => true)
    end

    fleets
  end
end
