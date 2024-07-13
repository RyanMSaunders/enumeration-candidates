# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
# require_relative 'candidates'



def find(id)
  
    @candidates.find { |candidate| candidate[:id] == id }

    # @candidates.each do | candidate |
    #   if candidate[:id] == id
    #     return candidate
    #   end
    # end

  end

  def experienced?(candidate)
   
    if candidate[:years_of_experience].to_i >= 2
      return true
    else
      return false
    end

  end

  def qualified_candidates(candidates)
   
    result = []

    candidates.each do | candidate |
      if experienced?(candidate) && github_pro?(candidate) && know_ruby_or_python?(candidate) && applied_in_last_15_days?(candidate) & over_17_yrs_old?(candidate)
      result.push(candidate)
      end
    end

    return result
  end

  # More methods will go below
  def github_pro?(candidate)
    if candidate[:github_points].to_i >= 100
      return true
    else
      return false
    end
  end

  def know_ruby_or_python?(candidate)
    if candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
      return true
    else
      return false
    end
  end

  def applied_in_last_15_days?(candidate)
    today = Date.today
  
    fifteen_days_ago = today - 15
  
    if candidate[:date_applied] >= fifteen_days_ago && candidate[:date_applied] <= today
      return true
    else
      return false
    end
  end

  def over_17_yrs_old?(candidate)
    if candidate[:age].to_i > 17
      return true
    else
      return false
    end
  end

  def ordered_by_qualifications(candidates)
    
    sorted_candidates = candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end

    return sorted_candidates

  end





  