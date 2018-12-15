module PeoplesHelper
  def national_phone(phone)
    national_phone = Phonelib.parse(phone)
    return national_phone.national
  end
  
  def international_phone(phone)
    local_phone = Phonelib.parse(phone)
    return local_phone.e164
  end
end
