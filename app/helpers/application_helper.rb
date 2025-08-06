module ApplicationHelper
  def _t(key)
    t = Translation.find_by_hebrew(key.strip)
    if t.nil?
      Translation.create(:hebrew => key.strip, :english => key.strip)
      return key
    else
      return t.english if current_user.language == "English"
      return t.hebrew if current_user.language == "Hebrew"
      return t.hebrew if current_user.language.nil?
    end
  end

  def fake_location
    a = Activity.where("lat is not null and longt is not null").sample(1)[0]
    return { :lat => a.lat, :longt => a.longt }
  end

  def fake_user_image_url
    value = rand(20) + 1
    return "https://themes.kopyov.com/limitless/demo/template/assets/images/demo/users/face#{value}.jpg"
  end

  def location_message_at(id, longt, lat, time)
    device = Device.find(id)
    location = "#{longt}:#{lat}"
    a = Activity.create(:device_id => device.id,
                        :fleet_id => device.fleet_id,
                        :level => "info",
                        :kind => "mobile-unit-location",
                        :message => "Location is #{location}",
                        :lat => lat, :longt => longt,
                        :location => location, :created_at => time)
  end

  def device_mobile?(request)
    agent = request.user_agent
    return true if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return true if agent =~ /Mobile/
    return false
  end

  def date_field(d)
    begin
      return d.strftime("%d/%m/%Y")
    rescue => exception
      return d
    end
  end

  def datetime_field(d)
    begin
      return d.strftime("%m/%d %H:%M")
    rescue => exception
      return d
    end
  end

  def time_field(d)
    begin
      return d.strftime("%H:%M")
    rescue => exception
      return d
    end
  end

  def date_time_field(d)
    begin
      return d.strftime("%Y-%m-%d %H:%M")
    rescue => exception
      return
    end
  end

  def tile(caption, value, icon, color = "text-primary")
    "
    <div class='tile #{color}'>
      <i class='fas #{icon} '></i> &nbsp; #{caption}<br/>
      <span class='text-end text-bold '>#{value}</span>
    </div>
    ".html_safe
  end

  def small_tile(caption, value, color = "bg-primary")
    "<div class='card card-body'>
          <div class='row'>
            <div class='col-lg-5'>
              <span>#{caption}</span>
            </div>
            <div class='col-lg-7 text-end'>
              <span class='badge #{color} rounded-pill'> #{value}</span>
            </div>
          </div>
        </div>".html_safe
  end

  def big_tile(caption, value, icon, color)
    "<div class='card card-body'>
      <div class='d-flex align-items-center'>
        <i class='fas #{icon} #{color} fa-3x'></i>
        <div class='flex-fill text-end'>
          <h4 class='mb-0'>#{value}</h4>
          <span class='text-muted'>#{caption}</span>
        </div>
      </div>
    </div>".html_safe
  end

  def badge_tag(value)
    color = "bg-success" if ["פעילה", "מולא", "חתום"].include? value
    color = "bg-info" if ["בקשת חידוש ברצף", "בקשת חידוש", "בקשת ביטול", "פתיחה", "UPLOADED"].include? value
    color = "bg-warning" if [""].include? value
    color = "bg-danger" if ["נדחה", "מבוטלת", "נדחה", "לא מולא", "לא חתום"].include? value

    "<badge class='badge #{color}'>#{value}</badge>".html_safe
  end

  def ins_company_name(id)
    begin
      return InsuranceCompany.find(id.to_i).name
    rescue
      "*"
    end
  end

  def policy_open?(p)
    begin
      p["status"] == "פתיחה"
    rescue
      false
    end
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{hours.to_s.rjust(2, "0")}:#{minutes.to_s.rjust(2, "0")}:#{seconds.to_s.rjust(2, "0")}"
    # or, as hagello suggested in the comments:
    # '%02d:%02d:%02d' % [hours, minutes, seconds]
  end

  def time_diff(time_diff)
    Time.at(time_diff.to_i.abs).utc.strftime "%H:%M:%S"
  end

  def diff_in_percents(current_pnl, previous_pnl)
    pnl_diff = current_pnl - previous_pnl
    pnl_diff_percent = (pnl_diff / previous_pnl) * 100
    pnl_diff_percent
  end

  require "write_xlsx"

  def csv_to_xls(csv, filename)
    workbook = WriteXLSX.new("tmp/#{filename}.xlsx")
    worksheet = workbook.add_worksheet
    format = workbook.add_format
    format.set_align("right")
    row = 0
    for line in csv.split("\n")
      cols = line.split(",")
      col = 0
      for value in cols
        worksheet.write_string(row, col, value.to_s, format)
        col += 1
      end
      row += 1
    end
    workbook.close
  end

  def osm_find_address(address)
    client = OpenStreetMap::Client.new
    client.search(q: address, format: "json", addressdetails: "1", accept_language: "il")
  end

  def osm_navigation(from_lat, from_longt, to_lat, to_longt)
    url = "https://router.project-osrm.org/route/v1/driving/#{from_longt},#{from_lat};#{to_longt},#{to_lat};13.428555,52.523219?overview=false"
    puts "URL: #{url}"
    res = JSON.parse(url)
    puts res.inspect
    # osm_loader = Mormon::OSM::Loader.new "docs/israel.osm"
    # osm_router = Mormon::OSM::Router.new osm_loader
    # osm_router.find_route node_start, node_end, transport
  end

  def graph_hopper_natvigation(from_lat, from_longt, to_lat, to_longt)
    url = "https://graphhopper.com/api/1/route?point=#{from_longt},#{from_lat}&point=#{to_longt},#{to_lat}&profile=car&locale=de&calc_points=false&key=2698cff3-54e1-4f6c-bc5c-9b0d009920c4"
    puts "URL:#{url}"
    res = JSON.parse(url)
    puts " -------------"
    puts res.inspect
  end
end
