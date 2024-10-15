# frozen_string_literal: true

module IprogOtpGenerator
 module OtpCode
  def generate_otp_code(length = 8)
   begin
    self.otp_code = Array.new(length) { rand(0..9) }.join
   end while self.class.exists?(otp_code: otp_code)

   self.otp_code_expires_at = Time.now + 5.minutes
   self.otp_code_confirmed  = false
   
   save(validate: false)
  end

  def valid_otp_code?(code = nil)
   return false unless otp_code && otp_code_expires_at

   if otp_code == code && otp_code_expires_at > Time.now
    update_columns otp_code_confirmed: true
   end

   otp_code_confirmed
  end

  def clear_otp_code
   self.otp_code            = nil 
   self.otp_code_expires_at = nil
   self.otp_code_confirmed  = false

   save(validate: false)
  end
 end
end
