module ApplicationHelper
  def icon_for_service(provider_name)
    case provider_name.downcase
    when /\Anetflix/i
      image_tag("netflix.png", alt: "Netflix", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Aparamount/i
      image_tag("para.png", alt: "Para", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Aamazon/i
      "<i class='fab fa-amazon'></i>".html_safe

    when /\Ahulu/i
      "<i class='fab fa-hulu'></i>".html_safe

    when /\Astan/i
      image_tag("stan.png", alt: "Stan", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Adisney/i
      "<i class='fab fa-disney'></i>".html_safe

    when /\Aapple/i
      "<i class='fab fa-apple'></i>".html_safe

    when /\Agoogle/i
      "<i class='fab fa-google-play'></i>".html_safe

    when /\Amicrosoft/i
      "<i class='fab fa-microsoft'></i>".html_safe

    when /\Afetch/i
      image_tag("fetch.png", alt: "Fetch", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Abinge/i
      image_tag("binge.png", alt: "Binge", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Afoxtel/i
      image_tag("foxtel.png", alt: "Foxtel", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    when /\Ayoutube/i
      image_tag("youtube.png", alt: "Youtube", class: "provider-icon", style: "width: 20px; height: 20px; vertical-align: middle;")

    else
      "<i class='fas fa-film'></i>".html_safe # Default icon if provider is not recognized
    end
  end
end
