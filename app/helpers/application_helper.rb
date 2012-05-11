module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Disruptage"
    if page_title.empty?
      base_title="Disruptage - Discuss Today's Most Disruptive Companies"
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end